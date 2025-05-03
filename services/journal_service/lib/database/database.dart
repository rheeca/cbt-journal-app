import 'package:dotenv/dotenv.dart';
import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:journal_service/generated/discover.pb.dart';
import 'package:journal_service/generated/goal.pb.dart';
import 'package:journal_service/generated/goal_checkin.pb.dart';
import 'package:journal_service/generated/journal_entry.pb.dart';
import 'package:journal_service/generated/user.pbgrpc.dart';
import 'package:journal_service/models/device.dart';
import 'package:journal_service/utils/goal.dart';
import 'package:journal_service/utils/util.dart';
import 'package:postgres/postgres.dart';

import 'tables.dart';
part 'database.g.dart';

var env = DotEnv(includePlatformEnvironment: true)..load();

@DriftDatabase(tables: [
  Devices,
  GoalCheckIns,
  Goals,
  GuidedJournals,
  JournalEntries,
  Users,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> initialize() async {
    // initialize database by querying a table
    await select(users).get();
  }

  static QueryExecutor _openConnection() {
    return PgDatabase(
      endpoint: Endpoint(
        host: env['DB_HOST'] ?? '',
        port: int.parse(env['DB_PORT'] ?? '5432'),
        database: env['DB_NAME'] ?? '',
        username: env['DB_USER'],
        password: env['DB_PASSWORD'],
        isUnixSocket: true,
      ),
      settings: ConnectionSettings(
        sslMode: SslMode.disable,
        connectTimeout: Duration(seconds: 10),
      ),
    );
  }
}

extension GoalQuery on AppDatabase {
  Future<List<Goal>> getGoalsByUser(String userId,
      {DateTime? lastSynced, bool? isDeleted}) async {
    SimpleSelectStatement<Goals, GoalEntity> stmt = select(goals)
      ..where((t) => t.userId.equals(userId));
    if (lastSynced != null) {
      stmt.where((t) => t.updatedAt.isBiggerThanValue(PgDateTime(lastSynced)));
    }
    if (isDeleted != null) {
      stmt.where((t) => t.isDeleted.equals(isDeleted));
    }

    final items = await stmt.get();
    return items
        .map((e) => Goal(
              id: e.id,
              userId: e.userId,
              createdAt: e.createdAt.toDateTime().toProtoTimestamp(),
              title: e.title,
              type: e.type,
              guideQuestions:
                  e.guideQuestions.map((e) => guideQuestionFromMap(e)).toList(),
              notificationSchedule: e.notificationSchedule,
              isArchived: e.isArchived,
              updatedAt: e.updatedAt.toDateTime().toProtoTimestamp(),
              isDeleted: e.isDeleted,
            ))
        .toList();
  }

  Future<void> insertGoals(List<Goal> items) {
    return batch((batch) {
      batch.insertAll(
          goals,
          items.map((e) => GoalsCompanion(
                id: Value(e.id),
                userId: Value(e.userId),
                createdAt: Value(PgDateTime(e.createdAt.toDateTime())),
                title: Value(e.title),
                type: Value(e.type),
                guideQuestions:
                    Value(e.guideQuestions.map((e) => e.toMap()).toList()),
                notificationSchedule: Value(e.notificationSchedule),
                isArchived: Value(e.isArchived),
                updatedAt: Value(PgDateTime(e.updatedAt.toDateTime())),
                isDeleted: Value(e.isDeleted),
              )),
          onConflict: DoUpdate<Goals, GoalEntity>.withExcluded(
              (old, excluded) => GoalsCompanion.custom(
                    id: excluded.id,
                    userId: excluded.userId,
                    createdAt: excluded.createdAt,
                    title: excluded.title,
                    type: excluded.type,
                    guideQuestions: excluded.guideQuestions,
                    notificationSchedule: excluded.notificationSchedule,
                    isArchived: excluded.isArchived,
                    updatedAt: excluded.updatedAt,
                    isDeleted: excluded.isDeleted,
                  ),
              where: (old, excluded) =>
                  old.updatedAt.isSmallerThan(excluded.updatedAt)));
    });
  }

  Future<void> deleteGoals(List<String> ids) {
    return (delete(goals)..where((t) => t.id.isIn(ids))).go();
  }

  Future<List<GoalCheckIn>> getGoalCheckIns(String userId,
      {DateTime? lastSynced}) async {
    SimpleSelectStatement<GoalCheckIns, GoalCheckInEntity> stmt =
        select(goalCheckIns)..where((t) => t.userId.equals(userId));
    if (lastSynced != null) {
      stmt.where((t) => t.updatedAt.isBiggerThanValue(PgDateTime(lastSynced)));
    }

    final items = await stmt.get();
    return items
        .map((e) => GoalCheckIn(
              userId: e.userId,
              date: e.date.toDateTime().toProtoTimestamp(),
              goals: e.goals,
              updatedAt: e.updatedAt.toDateTime().toProtoTimestamp(),
              isDeleted: e.isDeleted,
            ))
        .toList();
  }

  Future<void> insertGoalCheckIns(List<GoalCheckIn> items) async {
    await batch((batch) {
      batch.insertAll(
          goalCheckIns,
          items.map((e) => GoalCheckInsCompanion(
                userId: Value(e.userId),
                date: Value(PgDateTime(e.date.toDateTime())),
                goals: Value(e.goals.toSet()),
                updatedAt: Value(PgDateTime(e.updatedAt.toDateTime())),
                isDeleted: Value(e.isDeleted),
              )),
          onConflict: DoUpdate<GoalCheckIns, GoalCheckInEntity>.withExcluded(
              (old, excluded) => GoalCheckInsCompanion.custom(
                    userId: excluded.userId,
                    date: excluded.date,
                    goals: excluded.goals,
                    updatedAt: excluded.updatedAt,
                    isDeleted: excluded.isDeleted,
                  ),
              where: (old, excluded) =>
                  old.updatedAt.isSmallerThan(excluded.updatedAt)));
    });
  }
}

extension GuidedJournalQuery on AppDatabase {
  Future<List<GuidedJournal>> getGuidedJournals() async {
    final items = await (select(guidedJournals)).get();
    return items
        .map(
          (e) => GuidedJournal(
            id: e.id,
            title: e.title,
            guideQuestions: e.guideQuestions,
            description: e.description,
            journalType: e.journalType,
          ),
        )
        .toList();
  }
}

extension JournalEntryQuery on AppDatabase {
  Future<List<JournalEntry>> getJournalEntriesByUser(String userId,
      {DateTime? lastSynced, bool? isDeleted}) async {
    SimpleSelectStatement<JournalEntries, JournalEntryEntity> stmt =
        select(journalEntries)..where((t) => t.userId.equals(userId));
    if (lastSynced != null) {
      stmt.where((t) => t.updatedAt.isBiggerThanValue(PgDateTime(lastSynced)));
    }
    if (isDeleted != null) {
      stmt.where((t) => t.isDeleted.equals(isDeleted));
    }

    final items = await stmt.get();
    return items
        .map((e) => JournalEntry(
              id: e.id,
              userId: e.userId,
              createdAt: e.createdAt.toDateTime().toProtoTimestamp(),
              guidedJournal: e.guidedJournal,
              title: e.title,
              content: e.content.map((e) => guideQuestionFromMap(e)).toList(),
              updatedAt: e.updatedAt.toDateTime().toProtoTimestamp(),
              isDeleted: e.isDeleted,
            ))
        .toList();
  }

  Future<void> insertJournalEntries(List<JournalEntry> items) {
    return batch((batch) {
      batch.insertAll(
          journalEntries,
          items.map((e) => JournalEntriesCompanion(
                id: Value(e.id),
                userId: Value(e.userId),
                createdAt: Value(PgDateTime(e.createdAt.toDateTime())),
                guidedJournal: Value(e.guidedJournal),
                title: Value(e.title),
                content: Value(e.content.map((e) => e.toMap()).toList()),
                updatedAt: Value(PgDateTime(e.updatedAt.toDateTime())),
                isDeleted: Value(e.isDeleted),
              )),
          onConflict: DoUpdate<JournalEntries, JournalEntryEntity>.withExcluded(
              (old, excluded) => JournalEntriesCompanion.custom(
                    id: excluded.id,
                    userId: excluded.userId,
                    createdAt: excluded.createdAt,
                    guidedJournal: excluded.guidedJournal,
                    title: excluded.title,
                    content: excluded.content,
                    updatedAt: excluded.updatedAt,
                    isDeleted: excluded.isDeleted,
                  ),
              where: (old, excluded) =>
                  old.updatedAt.isSmallerThan(excluded.updatedAt)));
    });
  }

  Future<void> deleteJournalEntries(List<String> ids) {
    return (delete(journalEntries)..where((t) => t.id.isIn(ids))).go();
  }
}

extension UserQuery on AppDatabase {
  Future<List<User>> getUsers(
    List<String> ids, {
    DateTime? lastSynced,
    bool? isDeleted,
  }) async {
    SimpleSelectStatement<Users, UserEntity> stmt = select(users)
      ..where((t) => t.id.isIn(ids));
    if (lastSynced != null) {
      stmt.where((t) => t.updatedAt.isBiggerThanValue(PgDateTime(lastSynced)));
    }
    if (isDeleted != null) {
      stmt.where((t) => t.isDeleted.equals(isDeleted));
    }

    final items = await stmt.get();
    return items
        .map((e) => User(
              id: e.id,
              email: e.email,
              createdAt: e.createdAt.toDateTime().toProtoTimestamp(),
              displayName: e.displayName,
              updatedAt: e.updatedAt.toDateTime().toProtoTimestamp(),
              isDeleted: e.isDeleted,
            ))
        .toList();
  }

  Future<void> insertUsers(List<User> items) async {
    await batch((batch) {
      batch.insertAll(
          users,
          items.map(
            (e) => UsersCompanion(
              id: Value(e.id),
              email: Value(e.email),
              createdAt: Value(PgDateTime(e.createdAt.toDateTime())),
              displayName: Value(e.displayName),
              updatedAt: Value(PgDateTime(e.updatedAt.toDateTime())),
              isDeleted: Value(e.isDeleted),
            ),
          ),
          onConflict: DoUpdate<Users, UserEntity>.withExcluded(
              (old, excluded) => UsersCompanion.custom(
                    id: excluded.id,
                    email: excluded.email,
                    createdAt: excluded.createdAt,
                    displayName: excluded.displayName,
                    updatedAt: excluded.updatedAt,
                    isDeleted: excluded.isDeleted,
                  ),
              where: (old, excluded) =>
                  old.updatedAt.isSmallerThan(excluded.updatedAt)));
    });
  }

  Future<void> deleteUsers(List<String> ids) {
    return (delete(users)..where((t) => t.id.isIn(ids))).go();
  }
}

extension DeviceQuery on AppDatabase {
  Future<List<Device>> getDevices(String userId) async {
    SimpleSelectStatement<Devices, DeviceEntity> stmt = select(devices)
      ..where((t) => t.userId.equals(userId));

    final items = await stmt.get();
    return items
        .map((e) => Device(
              id: e.id,
              userId: e.userId,
              lastSynced: e.lastSynced.toDateTime(),
            ))
        .toList();
  }

  Future<void> insertDevices(List<Device> items) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        devices,
        items.map(
          (e) => DevicesCompanion(
            id: Value(e.id),
            userId: Value(e.userId),
            lastSynced: Value(PgDateTime(e.lastSynced)),
          ),
        ),
      );
    });
  }

  Future<void> deleteDevices(List<String> ids) {
    return (delete(devices)..where((t) => t.id.isIn(ids))).go();
  }
}
