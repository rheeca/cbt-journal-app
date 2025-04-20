import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/generated/goal.pbgrpc.dart';
import 'package:cbt_journal/generated/goal_checkin.pbgrpc.dart';
import 'package:cbt_journal/generated/journal_entry.pbgrpc.dart';
import 'package:cbt_journal/generated/user.pbgrpc.dart';
import 'package:cbt_journal/models/model.dart' as md;
import 'package:cbt_journal/util/util.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_it/watch_it.dart';

class JournalService {
  JournalService._internal();
  factory JournalService() {
    return JournalService._internal();
  }

  ClientChannel? _channel;
  GoalCheckInServiceClient? goalCheckInClient;
  GoalServiceClient? goalClient;
  JournalEntryServiceClient? journalEntryClient;
  UserServiceClient? userClient;

  Future<void> onSync() async {
    await _initialize();
    await _syncDown();
    await _syncUp();
    await _dispose();
  }

  Future<void> _initialize() async {
    await dotenv.load(fileName: ".env");

    _channel = ClientChannel(
      dotenv.env['SERVICE_ENDPOINT'] ?? '',
      port: int.parse(dotenv.env['SERVICE_PORT'] ?? '443'),
      options: const ChannelOptions(credentials: ChannelCredentials.secure()),
    );
    goalCheckInClient = GoalCheckInServiceClient(_channel!);
    goalClient = GoalServiceClient(_channel!);
    journalEntryClient = JournalEntryServiceClient(_channel!);
    userClient = UserServiceClient(_channel!);
  }

  Future<void> _dispose() async {
    userClient = null;
    await _channel?.shutdown();
  }

  Future<void> _syncDown() async {
    final prefs = await SharedPreferences.getInstance();
    final lastSynced = prefs.getString('lastSynced') != null
        ? DateTime.parse(prefs.getString('lastSynced')!).toProtoTimestamp()
        : null;
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      logger.d('failed to sync down from cloud: no logged in user');
      return;
    }

    final goalCheckIns =
        (await goalCheckInClient?.readGoalCheckIns(ReadGoalCheckInsRequest(
      userId: userId,
      lastSynced: lastSynced,
    )))
            ?.goalCheckIns;
    if (goalCheckIns != null && goalCheckIns.isNotEmpty) {
      await di<AppDatabase>().insertGoalCheckIns(
          goalCheckIns
              .map((e) => md.GoalCheckIn(
                    userId: e.userId,
                    date: e.date,
                    goals: e.goals.toSet(),
                    updatedAt: e.updatedAt.toDateTime(),
                    isDeleted: e.isDeleted,
                  ))
              .toList(),
          toSync: false);
    }

    final goals = (await goalClient?.readGoals(ReadGoalsRequest(
      userId: userId,
      lastSynced: lastSynced,
    )))
        ?.goals;
    if (goals != null && goals.isNotEmpty) {
      await di<AppDatabase>().insertGoals(
          goals.map((e) => md.Goal.fromPb(e)).toList(),
          toSync: false);
    }

    final journalEntries =
        (await journalEntryClient?.readJournalEntries(ReadJournalEntriesRequest(
      userId: userId,
      lastSynced: lastSynced,
    )))
            ?.journalEntries;
    if (journalEntries != null && journalEntries.isNotEmpty) {
      await di<AppDatabase>().insertJournalEntries(
          journalEntries.map((e) => md.JournalEntry.fromPb(e)).toList(),
          toSync: false);
    }

    final user = (await userClient?.readUsers(ReadUsersRequest(
      ids: [userId],
      lastSynced: lastSynced,
    )))
        ?.users
        .firstOrNull;
    if (user != null) {
      await di<AppDatabase>().insertUsers([user], toSync: false);
    }

    await prefs.setString(
        'lastSynced', DateTime.now().toUtc().toIso8601String());
  }

  Future<void> _syncUp() async {
    final logs = await di<AppDatabase>().getSyncLogs();
    final groupedLogs = groupBy(logs, (e) => e.type);

    final checkInLogs = groupedLogs[md.DatabaseType.goalCheckIn];
    if (checkInLogs != null) {
      final splitStr = checkInLogs[0].id.split('+');
      final userId = splitStr[0];

      final dates =
          checkInLogs.map((e) => DateTime.parse(e.id.split('+')[1])).toList();
      final checkIns = await di<AppDatabase>()
          .getGoalCheckIns(userId: userId, dates: dates, includeDeleted: true);

      if (checkIns.isNotEmpty) {
        await goalCheckInClient?.writeGoalCheckIns(WriteGoalCheckInsRequest(
          goalCheckIns: checkIns.map((e) => GoalCheckIn(
                userId: e.userId,
                date: e.date.toProtoTimestamp(),
                goals: e.goals,
              )),
        ));
      }
    }

    final goalLogs = groupedLogs[md.DatabaseType.goal];
    if (goalLogs != null) {
      final ids = goalLogs.map((e) => e.id).toList();
      final goals =
          await di<AppDatabase>().getGoals(ids: ids, includeDeleted: true);
      final toDelete = ids.where((e) => !goals.map((e) => e.id).contains(e));

      if (goals.isNotEmpty) {
        await goalClient?.writeGoals(WriteGoalsRequest(
          goals: goals.map((e) => Goal(
                id: e.id,
                userId: e.userId,
                createdAt: e.createdAt.toProtoTimestamp(),
                title: e.title,
                type: e.type.name,
                guideQuestions: e.guideQuestions.map((e) => GuideQuestion(
                      question: e.question,
                      answer: e.answer,
                      type: e.type.name,
                      answerType: e.answerType.name,
                      answerCanvasElements: e.answerCanvasElements,
                      answerCanvasImage: e.answerCanvasImage,
                    )),
                notificationSchedule:
                    e.notificationSchedule.map((e) => e.name).toList(),
                isArchived: e.isArchived,
              )),
        ));
      }
      if (toDelete.isNotEmpty) {
        await goalClient?.deleteGoals(DeleteGoalsRequest(ids: toDelete));
      }
    }

    final journalLogs = groupedLogs[md.DatabaseType.journalEntry];
    if (journalLogs != null) {
      final ids = journalLogs.map((e) => e.id).toList();
      final entries = await di<AppDatabase>()
          .getJournalEntries(ids: ids, includeDeleted: true);
      final toDelete = ids.where((e) => !entries.map((e) => e.id).contains(e));

      if (entries.isNotEmpty) {
        await journalEntryClient
            ?.writeJournalEntries(WriteJournalEntriesRequest(
          journalEntries: entries.map((e) => JournalEntry(
                id: e.id,
                userId: e.userId,
                createdAt: e.createdAt.toProtoTimestamp(),
                guidedJournal: e.guidedJournal,
                title: e.title,
                content: e.content.map((e) => GuideQuestion(
                      question: e.question,
                      answer: e.answer,
                      type: e.type.name,
                      answerType: e.answerType.name,
                      answerCanvasElements: e.answerCanvasElements,
                      answerCanvasImage: e.answerCanvasImage,
                    )),
              )),
        ));
      }
      if (toDelete.isNotEmpty) {
        await journalEntryClient
            ?.deleteJournalEntries(DeleteJournalEntriesRequest(ids: toDelete));
      }
    }

    final userLogs = groupedLogs[md.DatabaseType.user];
    if (userLogs != null) {
      final userIds = userLogs.map((e) => e.id).toList();
      final users =
          await di<AppDatabase>().getUsers(userIds, includeDeleted: true);
      final toDelete =
          userIds.where((e) => !users.map((e) => e.id).contains(e));

      if (users.isNotEmpty) {
        await userClient?.writeUsers(WriteUsersRequest(
          users: users,
        ));
      }
      if (toDelete.isNotEmpty) {
        await userClient?.deleteUsers(DeleteUsersRequest(ids: toDelete));
      }
    }

    await di<AppDatabase>().clearSyncLogs();
  }
}
