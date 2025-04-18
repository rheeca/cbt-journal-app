import 'package:cbt_journal/generated/user.pb.dart';
import 'package:cbt_journal/goals/edit_goal/edit_goal.dart';
import 'package:cbt_journal/models/common.dart';
import 'package:cbt_journal/models/journal_entry.dart';
import 'package:cbt_journal/util/util.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:logger/logger.dart';
import 'package:cbt_journal/models/model.dart' as md;
import 'tables.dart';

part 'database.g.dart';

var logger = Logger();

@DriftDatabase(tables: [
  GoalCheckIns,
  GoalEntries,
  Goals,
  GuidedJournals,
  JournalEntries,
  SyncLogs,
  Users,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'cbt_journal_database'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    });
  }
}

extension GoalQuery on AppDatabase {
  Future<md.Goal?> getGoalById(String goalId) async {
    final goal = await (select(goals)..where((t) => t.id.equals(goalId)))
        .getSingleOrNull();

    if (goal != null) {
      final goalEntriesFromDb = await getGoalEntriesByGoal(goal.id);
      return md.Goal(
        id: goal.id,
        userId: goal.userId,
        createdAt: goal.createdAt,
        title: goal.title,
        type: GoalActivity.getByName(goal.type)!,
        guideQuestions: goal.guideQuestions
            .map((e) => md.GuideQuestion.fromMap(e))
            .toList(),
        notificationSchedule: goal.notificationSchedule
            .map((e) => md.DayOfWeek.values.byName(e))
            .toList(),
        journalEntries: goalEntriesFromDb.map((e) => e.journalEntryId).toList(),
        isArchived: goal.isArchived,
      );
    } else {
      return null;
    }
  }

  Future<List<md.Goal>> getGoals(List<String> ids) async {
    List<md.Goal> resp = [];

    final goalsFromDb =
        await (select(goals)..where((t) => t.id.isIn(ids))).get();
    for (GoalEntity g in goalsFromDb) {
      final goalEntriesFromDb = await getGoalEntriesByGoal(g.id);
      resp.add(md.Goal(
        id: g.id,
        userId: g.userId,
        createdAt: g.createdAt,
        title: g.title,
        type: GoalActivity.getByName(g.type)!,
        guideQuestions:
            g.guideQuestions.map((e) => md.GuideQuestion.fromMap(e)).toList(),
        notificationSchedule: g.notificationSchedule
            .map((e) => md.DayOfWeek.values.byName(e))
            .toList(),
        journalEntries: goalEntriesFromDb.map((e) => e.journalEntryId).toList(),
        isArchived: g.isArchived,
      ));
    }
    return resp;
  }

  Future<List<md.Goal>> getGoalsByUser(String userId) async {
    List<md.Goal> userGoals = [];

    final goalsFromDb =
        await (select(goals)..where((t) => t.userId.equals(userId))).get();
    for (GoalEntity g in goalsFromDb) {
      final goalEntriesFromDb = await getGoalEntriesByGoal(g.id);
      userGoals.add(md.Goal(
        id: g.id,
        userId: g.userId,
        createdAt: g.createdAt,
        title: g.title,
        type: GoalActivity.getByName(g.type)!,
        guideQuestions:
            g.guideQuestions.map((e) => md.GuideQuestion.fromMap(e)).toList(),
        notificationSchedule: g.notificationSchedule
            .map((e) => md.DayOfWeek.values.byName(e))
            .toList(),
        journalEntries: goalEntriesFromDb.map((e) => e.journalEntryId).toList(),
        isArchived: g.isArchived,
      ));
    }
    return userGoals;
  }

  Future<int> insertGoal(md.Goal item) {
    insertSyncLog(md.SyncLog(item.id, DatabaseType.goal));

    for (final e in item.journalEntries) {
      into(goalEntries).insertOnConflictUpdate(GoalEntriesCompanion(
        journalEntryId: Value(e),
        goalId: Value(item.id),
      ));
    }

    return into(goals).insertOnConflictUpdate(GoalsCompanion(
      id: Value(item.id),
      userId: Value(item.userId),
      createdAt: Value(item.createdAt),
      title: Value(item.title),
      type: Value(item.type.name),
      guideQuestions: Value(item.guideQuestions.map((e) => e.toMap()).toList()),
      notificationSchedule:
          Value(item.notificationSchedule.map((e) => e.name).toList()),
      isArchived: Value(item.isArchived),
    ));
  }

  Future<void> deleteGoal(String id) {
    insertSyncLog(md.SyncLog(id, DatabaseType.goal));

    (delete(goalEntries)..where((t) => t.goalId.isValue(id))).go();
    return (delete(goals)..where((t) => t.id.isValue(id))).go();
  }

  Future<List<GoalEntryEntity>> getGoalEntriesByGoal(String goalId) {
    return (select(goalEntries)..where((t) => t.goalId.equals(goalId))).get();
  }

  Future<List<GoalEntryEntity>> getGoalEntriesByJournal(String journalId) {
    return (select(goalEntries)
          ..where((t) => t.journalEntryId.equals(journalId)))
        .get();
  }

  Future<void> deleteGoalEntry(String id) {
    return (delete(goalEntries)..where((t) => t.journalEntryId.isValue(id)))
        .go();
  }

  Future<List<md.GoalCheckIn>> getGoalCheckInsByUser(String userId) async {
    final items = await (select(goalCheckIns)
          ..where((t) => t.userId.equals(userId)))
        .get();

    return items
        .map((e) => md.GoalCheckIn(
              userId: e.userId,
              date: e.date,
              goals: e.goals,
            ))
        .toList();
  }

  Future<List<md.GoalCheckIn>> getGoalCheckIns(
      String userId, List<DateTime> dates) async {
    final items = await (select(goalCheckIns)
          ..where((t) => t.userId.equals(userId) & t.date.isIn(dates)))
        .get();

    return items
        .map((e) => md.GoalCheckIn(
              userId: e.userId,
              date: e.date,
              goals: e.goals,
            ))
        .toList();
  }

  Future<md.GoalCheckIn?> getGoalCheckIn(String userId, DateTime date) async {
    final item = await (select(goalCheckIns)
          ..where((t) =>
              t.userId.equals(userId) & t.date.equals(dateOnlyUtc(date))))
        .getSingleOrNull();

    if (item != null) {
      return md.GoalCheckIn(
        userId: item.userId,
        date: item.date,
        goals: item.goals,
      );
    } else {
      return null;
    }
  }

  Future<int> insertGoalCheckIn(md.GoalCheckIn item) {
    insertSyncLog(
        md.SyncLog('${item.userId}+${item.date}', DatabaseType.goalCheckIn));

    return into(goalCheckIns).insertOnConflictUpdate(GoalCheckInsCompanion(
      userId: Value(item.userId),
      date: Value(dateOnlyUtc(item.date)),
      goals: Value(item.goals),
    ));
  }
}

extension GuidedJournalQuery on AppDatabase {
  Future<GuidedJournal?> getGuidedJournal(String id) async {
    final item = await (select(guidedJournals)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    if (item != null) {
      return GuidedJournal(
          id: item.id,
          title: item.title,
          guideQuestions: item.guideQuestions,
          description: item.description,
          journalType: item.journalType
              .map((e) => JournalType.values.byName(e))
              .toList());
    } else {
      return null;
    }
  }

  Future<GuidedJournal?> getGuidedJournalByTitle(String title) async {
    final item = await (select(guidedJournals)
          ..where((t) => t.title.equals(title)))
        .getSingleOrNull();
    if (item != null) {
      return GuidedJournal(
          id: item.id,
          title: item.title,
          guideQuestions: item.guideQuestions,
          description: item.description,
          journalType: item.journalType
              .map((e) => JournalType.values.byName(e))
              .toList());
    } else {
      return null;
    }
  }

  Future<List<GuidedJournal>> getAllGuidedJournals() async {
    final items = await (select(guidedJournals)).get();
    return items
        .map(
          (e) => GuidedJournal(
              id: e.id,
              title: e.title,
              guideQuestions: e.guideQuestions,
              description: e.description,
              journalType: e.journalType
                  .map((e) => JournalType.values.byName(e))
                  .toList()),
        )
        .toList();
  }

  Future<int> insertGuidedJournal(md.GuidedJournal gj) {
    return into(guidedJournals).insertOnConflictUpdate(GuidedJournalsCompanion(
      id: Value(gj.id),
      title: Value(gj.title),
      guideQuestions: Value(gj.guideQuestions),
      description: Value(gj.description),
      journalType: Value(gj.journalType.map((e) => e.name).toList()),
    ));
  }
}

extension UserQuery on AppDatabase {
  Future<md.UserModel?> getUser(String userId) async {
    final user = await (select(users)..where((t) => t.id.equals(userId)))
        .getSingleOrNull();
    if (user != null) {
      return md.UserModel(
        userId: user.id,
        email: user.email,
        displayName: user.displayName,
        createdAt: user.createdAt,
      );
    } else {
      return null;
    }
  }

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

  Future<int> insertUser(md.UserModel user) {
    insertSyncLog(md.SyncLog(user.userId, DatabaseType.user));

    return into(users).insertOnConflictUpdate(UsersCompanion(
      id: Value(user.userId),
      email: Value(user.email),
      displayName: Value(user.displayName),
      createdAt: Value(user.createdAt),
    ));
  }

  Future<void> deleteUser(String id) {
    insertSyncLog(md.SyncLog(id, DatabaseType.user));

    return (delete(users)..where((t) => t.id.isValue(id))).go();
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
              createdAt: e.createdAt,
              guidedJournal: e.guidedJournal,
              title: e.title,
              content: e.content.map((e) => GuideQuestion.fromMap(e)).toList(),
            ))
        .toList();
  }

  Future<List<JournalEntry>> getJournalEntries(List<String> ids) async {
    final items =
        await (select(journalEntries)..where((t) => t.id.isIn(ids))).get();
    return items
        .map((e) => JournalEntry(
              id: e.id,
              userId: e.userId,
              createdAt: e.createdAt,
              guidedJournal: e.guidedJournal,
              title: e.title,
              content: e.content.map((e) => GuideQuestion.fromMap(e)).toList(),
            ))
        .toList();
  }

  Future<JournalEntry?> getJournalEntryById(String journalId) async {
    final item = await (select(journalEntries)
          ..where((t) => t.id.equals(journalId)))
        .getSingleOrNull();
    if (item != null) {
      return JournalEntry(
        id: item.id,
        userId: item.userId,
        createdAt: item.createdAt,
        guidedJournal: item.guidedJournal,
        title: item.title,
        content: item.content.map((e) => GuideQuestion.fromMap(e)).toList(),
      );
    } else {
      return null;
    }
  }

  Future<int> insertJournalEntry(md.JournalEntry item) {
    insertSyncLog(md.SyncLog(item.id, DatabaseType.journalEntry));

    return into(journalEntries).insertOnConflictUpdate(JournalEntriesCompanion(
      id: Value(item.id),
      userId: Value(item.userId),
      createdAt: Value(item.createdAt),
      guidedJournal: Value(item.guidedJournal),
      title: Value(item.title),
      content: Value(item.content.map((e) => e.toMap()).toList()),
    ));
  }

  Future<void> deleteJournalEntry(String id) {
    insertSyncLog(md.SyncLog(id, DatabaseType.journalEntry));

    return (delete(journalEntries)..where((t) => t.id.isValue(id))).go();
  }
}

extension SyncLogQuery on AppDatabase {
  Future<List<md.SyncLog>> getSyncLogs() async {
    final logs = await (select(syncLogs)).get();
    return logs
        .map((e) => md.SyncLog(e.id, DatabaseType.values.byName(e.type)))
        .toList();
  }

  Future<int> insertSyncLog(md.SyncLog log) {
    return into(syncLogs).insertOnConflictUpdate(SyncLogsCompanion(
      id: Value(log.id),
      type: Value(log.type.name),
    ));
  }

  Future<void> clearSyncLogs() {
    return (delete(syncLogs)).go();
  }
}
