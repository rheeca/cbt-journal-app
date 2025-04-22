import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/generated/goal.pbgrpc.dart';
import 'package:cbt_journal/generated/goal_checkin.pbgrpc.dart';
import 'package:cbt_journal/generated/journal_entry.pbgrpc.dart';
import 'package:cbt_journal/generated/user.pbgrpc.dart';
import 'package:cbt_journal/models/model.dart' as md;
import 'package:cbt_journal/util/util.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JournalService extends ChangeNotifier {
  JournalService({required AppDatabase database}) : _database = database;

  final AppDatabase _database;
  ClientChannel? _channel;
  GoalCheckInServiceClient? goalCheckInClient;
  GoalServiceClient? goalClient;
  JournalEntryServiceClient? journalEntryClient;
  UserServiceClient? userClient;

  bool _syncing = false;
  bool get syncing => _syncing;

  Future<void> load() async {
    await _initialize();
  }

  Future<void> onSync() async {
    _syncing = true;
    notifyListeners();

    await _syncDown();
    await _syncUp();

    _syncing = false;
    notifyListeners();
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

  // Future<void> _dispose() async {
  //   goalCheckInClient = null;
  //   goalClient = null;
  //   journalEntryClient = null;
  //   userClient = null;
  //   await _channel?.shutdown();
  // }

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

    final user = (await userClient?.readUsers(ReadUsersRequest(
      ids: [userId],
      lastSynced: lastSynced,
    )))
        ?.users
        .firstOrNull;
    if (user != null) {
      await _database.insertUsers([user], toSync: false);
    }

    final goals = (await goalClient?.readGoals(ReadGoalsRequest(
      userId: userId,
      lastSynced: lastSynced,
    )))
        ?.goals;
    if (goals != null && goals.isNotEmpty) {
      await _database.insertGoals(goals.map((e) => md.Goal.fromPb(e)).toList(),
          toSync: false);
    }

    final goalCheckIns =
        (await goalCheckInClient?.readGoalCheckIns(ReadGoalCheckInsRequest(
      userId: userId,
      lastSynced: lastSynced,
    )))
            ?.goalCheckIns;
    if (goalCheckIns != null && goalCheckIns.isNotEmpty) {
      await _database.insertGoalCheckIns(
          goalCheckIns.map((e) => md.GoalCheckIn.fromPb(e)).toList(),
          toSync: false);
    }

    final journalEntries =
        (await journalEntryClient?.readJournalEntries(ReadJournalEntriesRequest(
      userId: userId,
      lastSynced: lastSynced,
    )))
            ?.journalEntries;
    if (journalEntries != null && journalEntries.isNotEmpty) {
      await _database.insertJournalEntries(
          journalEntries.map((e) => md.JournalEntry.fromPb(e)).toList(),
          toSync: false);
    }

    await prefs.setString(
        'lastSynced', DateTime.now().toUtc().toIso8601String());
  }

  Future<void> _syncUp() async {
    final logs = await _database.getSyncLogs();
    final groupedLogs = groupBy(logs, (e) => e.type);

    final checkInLogs = groupedLogs[md.DatabaseType.goalCheckIn];
    if (checkInLogs != null) {
      final splitStr = checkInLogs[0].id.split('+');
      final userId = splitStr[0];

      final dates =
          checkInLogs.map((e) => DateTime.parse(e.id.split('+')[1])).toList();
      final checkIns = await _database.getGoalCheckIns(
          userId: userId, dates: dates, includeDeleted: true);

      if (checkIns.isNotEmpty) {
        await goalCheckInClient?.writeGoalCheckIns(WriteGoalCheckInsRequest(
          goalCheckIns: checkIns.map((e) => e.toPb()),
        ));
      }
    }

    final goalLogs = groupedLogs[md.DatabaseType.goal];
    if (goalLogs != null) {
      final ids = goalLogs.map((e) => e.id).toList();
      final goals = await _database.getGoals(ids: ids, includeDeleted: true);

      if (goals.isNotEmpty) {
        await goalClient?.writeGoals(WriteGoalsRequest(
          goals: goals.map((e) => e.toPb()),
        ));
      }
    }

    final journalLogs = groupedLogs[md.DatabaseType.journalEntry];
    if (journalLogs != null) {
      final ids = journalLogs.map((e) => e.id).toList();
      final entries =
          await _database.getJournalEntries(ids: ids, includeDeleted: true);

      if (entries.isNotEmpty) {
        await journalEntryClient
            ?.writeJournalEntries(WriteJournalEntriesRequest(
          journalEntries: entries.map((e) => e.toPb()),
        ));
      }
    }

    final userLogs = groupedLogs[md.DatabaseType.user];
    if (userLogs != null) {
      final userIds = userLogs.map((e) => e.id).toList();
      final users = await _database.getUsers(userIds, includeDeleted: true);

      if (users.isNotEmpty) {
        await userClient?.writeUsers(WriteUsersRequest(
          users: users,
        ));
      }
    }

    await _database.clearSyncLogs();
  }
}
