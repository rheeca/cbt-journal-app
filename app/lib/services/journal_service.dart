import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/generated/device.pbgrpc.dart';
import 'package:cbt_journal/generated/discover.pbgrpc.dart';
import 'package:cbt_journal/generated/goal.pbgrpc.dart';
import 'package:cbt_journal/generated/goal_checkin.pbgrpc.dart';
import 'package:cbt_journal/generated/journal_entry.pbgrpc.dart';
import 'package:cbt_journal/generated/user.pbgrpc.dart';
import 'package:cbt_journal/models/model.dart' as md;
import 'package:cbt_journal/util/util.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class JournalService extends ChangeNotifier {
  JournalService({required AppDatabase database}) : _database = database;

  final AppDatabase _database;
  ClientChannel? _channel;
  DeviceServiceClient? deviceClient;
  DiscoverServiceClient? discoverClient;
  GoalCheckInServiceClient? goalCheckInClient;
  GoalServiceClient? goalClient;
  JournalEntryServiceClient? journalEntryClient;
  UserServiceClient? userClient;

  bool _syncing = false;
  bool get syncing => _syncing;

  SharedPreferences? prefs;

  Future<void> load() async {
    await _initialize();
  }

  Future<void> onSync() async {
    _syncing = true;
    notifyListeners();

    await _syncDown();

    // TODO: refactor and make more efficient
    String? deviceId = prefs!.getString('deviceId');
    if (deviceId == null) {
      deviceId = const Uuid().v4();
      await prefs!.setString('deviceId', deviceId);
      await _syncUp();
    } else {
      await _syncUp(updatesOnly: true);
    }

    await _syncDevice();

    _syncing = false;
    notifyListeners();
  }

  Future<void> _initialize() async {
    await dotenv.load(fileName: ".env");
    prefs = await SharedPreferences.getInstance();

    _channel = ClientChannel(
      dotenv.env['SERVICE_ENDPOINT'] ?? '',
      port: int.parse(dotenv.env['SERVICE_PORT'] ?? '443'),
      options: const ChannelOptions(credentials: ChannelCredentials.secure()),
    );
    deviceClient = DeviceServiceClient(_channel!);
    discoverClient = DiscoverServiceClient(_channel!);
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
    final lastSynced = prefs!.getString('lastSynced') != null
        ? DateTime.parse(prefs!.getString('lastSynced')!).toProtoTimestamp()
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

    await prefs!
        .setString('lastSynced', DateTime.now().toUtc().toIso8601String());
  }

  Future<void> _syncUp({bool updatesOnly = false}) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      logger.d('failed to sync up to cloud: no logged in user');
      return;
    }

    final checkIns = <md.GoalCheckIn>[];
    final goals = <md.Goal>[];
    final entries = <md.JournalEntry>[];
    final users = <User>[];

    if (updatesOnly) {
      final logs = await _database.getSyncLogs();
      final groupedLogs = groupBy(logs, (e) => e.type);

      final checkInLogs = groupedLogs[md.DatabaseType.goalCheckIn];
      if (checkInLogs != null) {
        final dates =
            checkInLogs.map((e) => DateTime.parse(e.id.split('+')[1])).toList();
        checkIns.addAll(await _database.getGoalCheckIns(
            userId: userId, dates: dates, includeDeleted: true));
      }

      final goalLogs = groupedLogs[md.DatabaseType.goal];
      if (goalLogs != null) {
        final ids = goalLogs.map((e) => e.id).toList();
        goals.addAll(await _database.getGoals(ids: ids, includeDeleted: true));
      }

      final journalLogs = groupedLogs[md.DatabaseType.journalEntry];
      if (journalLogs != null) {
        final ids = journalLogs.map((e) => e.id).toList();
        entries.addAll(
            await _database.getJournalEntries(ids: ids, includeDeleted: true));
      }

      final userLogs = groupedLogs[md.DatabaseType.user];
      if (userLogs != null) {
        final userIds = userLogs.map((e) => e.id).toList();
        users.addAll(await _database.getUsers(userIds, includeDeleted: true));
      }
    } else {
      checkIns.addAll(await _database.getGoalCheckIns(
          userId: userId, includeDeleted: true));
      goals.addAll(
          await _database.getGoals(userId: userId, includeDeleted: true));
      entries.addAll(await _database.getJournalEntries(
          userId: userId, includeDeleted: true));
      users.addAll(await _database.getUsers([userId], includeDeleted: true));
    }

    if (checkIns.isNotEmpty) {
      await goalCheckInClient?.writeGoalCheckIns(WriteGoalCheckInsRequest(
        goalCheckIns: checkIns.map((e) => e.toPb()),
      ));
    }
    if (goals.isNotEmpty) {
      await goalClient?.writeGoals(WriteGoalsRequest(
        goals: goals.map((e) => e.toPb()),
      ));
    }
    if (entries.isNotEmpty) {
      await journalEntryClient?.writeJournalEntries(WriteJournalEntriesRequest(
        journalEntries: entries.map((e) => e.toPb()),
      ));
    }
    if (users.isNotEmpty) {
      await userClient?.writeUsers(WriteUsersRequest(
        users: users,
      ));
    }

    await _database.clearSyncLogs();
  }

  Future<void> _syncDevice() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      logger.d('failed to sync device: no logged in user');
      return;
    }
    String? deviceId = prefs!.getString('deviceId');
    if (deviceId == null) {
      logger.d('failed to sync device: no device id');
      return;
    }
    final resp = await deviceClient?.sync(SyncRequest(
      id: deviceId,
      userId: userId,
    ));

    final deletedGoals = resp?.deletedGoals;
    if (deletedGoals != null && deletedGoals.isNotEmpty) {
      await _database.deleteGoals(deletedGoals);
    }

    final deletedJournalEntries = resp?.deletedJournalEntries;
    if (deletedJournalEntries != null && deletedJournalEntries.isNotEmpty) {
      await _database.deleteJournalEntries(deletedJournalEntries);
    }
  }

  Future<void> logoutDevice() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      logger.d('failed to logout device: no logged in user');
      return;
    }
    final deviceId = prefs!.getString('deviceId');
    if (deviceId == null) {
      logger.d('failed to logout device: no device id');
      return;
    }

    await deviceClient?.logout(LogoutRequest(
      id: deviceId,
      userId: userId,
    ));
  }

  Future<void> downloadDiscover() async {
    final resp =
        await discoverClient?.readGuidedJournals(ReadGuidedJournalsRequest());
    if (resp != null && resp.guidedJournals.isNotEmpty) {
      await _database.insertGuidedJournals(resp.guidedJournals);
    }
  }
}
