import 'package:dotenv/dotenv.dart';
import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:journal_service/generated/goal.pb.dart';
import 'package:journal_service/generated/goal_checkin.pb.dart';
import 'package:journal_service/generated/journal_entry.pb.dart';
import 'package:journal_service/generated/user.pbgrpc.dart';
import 'package:journal_service/utils/goal.dart';
import 'package:journal_service/utils/util.dart';
import 'package:postgres/postgres.dart';

import 'tables.dart';
part 'database.g.dart';

var env = DotEnv(includePlatformEnvironment: true)..load();

@DriftDatabase(tables: [GoalCheckIns, Goals, JournalEntries, Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

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
  Future<List<Goal>> getGoalsByUser(String userId) async {
    final items =
        await (select(goals)..where((t) => t.id.equals(userId))).get();

    return items
        .map((e) => Goal(
              id: e.id,
              userId: e.userId,
              createdAt: e.createdAt.toProtoTimestamp(),
              title: e.title,
              type: e.type,
              guideQuestions:
                  e.guideQuestions.map((e) => guideQuestionFromMap(e)).toList(),
              notificationSchedule: e.notificationSchedule,
              isArchived: e.isArchived,
            ))
        .toList();
  }

  Future<void> insertGoals(List<Goal> items) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(
          goals,
          items.map((e) => GoalsCompanion(
                id: Value(e.id),
                userId: Value(e.userId),
                createdAt: Value(e.createdAt.toDateTime()),
                title: Value(e.title),
                type: Value(e.type),
                guideQuestions:
                    Value(e.guideQuestions.map((e) => e.toMap()).toList()),
                notificationSchedule: Value(e.notificationSchedule),
                isArchived: Value(e.isArchived),
              )));
    });
  }

  Future<void> deleteGoals(List<String> ids) {
    return (delete(goals)..where((t) => t.id.isIn(ids))).go();
  }

  Future<List<GoalCheckIn>> getGoalCheckInsByUser(String userId) async {
    final items = await (select(goalCheckIns)
          ..where((t) => t.userId.equals(userId)))
        .get();

    return items
        .map((e) => GoalCheckIn(
              userId: e.userId,
              date: e.date.toProtoTimestamp(),
              goals: e.goals,
            ))
        .toList();
  }

  Future<void> insertGoalCheckIns(List<GoalCheckIn> items) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
          goalCheckIns,
          items.map((e) => GoalCheckInsCompanion(
                userId: Value(e.userId),
                date: Value(e.date.toDateTime()),
                goals: Value(e.goals.toSet()),
              )));
    });
  }
}

extension JournalEntryQuery on AppDatabase {
  Future<List<JournalEntry>> getJournalEntriesByUser(String userId) async {
    final items = await (select(journalEntries)
          ..where((t) => t.userId.equals(userId))
          ..orderBy([
            (u) =>
                OrderingTerm(expression: u.createdAt, mode: OrderingMode.desc)
          ]))
        .get();
    return items
        .map((e) => JournalEntry(
              id: e.id,
              userId: e.userId,
              createdAt: e.createdAt.toProtoTimestamp(),
              guidedJournal: e.guidedJournal,
              title: e.title,
              content: e.content.map((e) => guideQuestionFromMap(e)).toList(),
            ))
        .toList();
  }

  Future<void> insertJournalEntries(List<JournalEntry> items) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(
          journalEntries,
          items.map((e) => JournalEntriesCompanion(
                id: Value(e.id),
                userId: Value(e.userId),
                createdAt: Value(e.createdAt.toDateTime()),
                guidedJournal: Value(e.guidedJournal),
                title: Value(e.title),
                content: Value(e.content.map((e) => e.toMap()).toList()),
              )));
    });
  }

  Future<void> deleteJournalEntries(List<String> ids) {
    return (delete(journalEntries)..where((t) => t.id.isIn(ids))).go();
  }
}

extension UserQuery on AppDatabase {
  Future<List<User>> getUsers(List<String> ids) async {
    final items = await (select(users)..where((t) => t.id.isIn(ids))).get();
    return items
        .map((e) => User(
              id: e.id,
              email: e.email,
              createdAt: e.createdAt.toProtoTimestamp(),
              displayName: e.displayName,
            ))
        .toList();
  }

  Future<int> insertUser(User user) {
    return into(users).insertOnConflictUpdate(UsersCompanion(
      id: Value(user.id),
      email: Value(user.email),
      createdAt: Value(user.createdAt.toDateTime()),
      displayName: Value(user.displayName),
    ));
  }

  Future<void> insertUsers(List<User> items) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
          users,
          items.map((e) => UsersCompanion(
                id: Value(e.id),
                email: Value(e.email),
                createdAt: Value(e.createdAt.toDateTime()),
                displayName: Value(e.displayName),
              )));
    });
  }

  Future<void> deleteUser(String id) {
    return (delete(users)..where((t) => t.id.isValue(id))).go();
  }

  Future<void> deleteUsers(List<String> ids) {
    return (delete(users)..where((t) => t.id.isIn(ids))).go();
  }
}
