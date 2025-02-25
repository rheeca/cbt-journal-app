import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:logger/logger.dart';
import 'package:cbt_journal/models/model.dart' as md;
import 'tables.dart';

part 'database.g.dart';

var logger = Logger();

@DriftDatabase(
    tables: [GoalEntries, Goals, GuidedJournals, JournalEntries, Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'cbt_journal_database'));

  @override
  int get schemaVersion => 1;
}

extension GoalQuery on AppDatabase {
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
      guideQuestions: Value(item.guideQuestions.map((e) => e.toMap()).toList()),
      notificationSchedule:
          Value(item.notificationSchedule.map((e) => e.name).toList()),
      isArchived: Value(item.isArchived),
    ));
  }

  Future<void> deleteGoal(String id) {
    (delete(goalEntries)..where((t) => t.goalId.isValue(id))).go();
    return (delete(goals)..where((t) => t.id.isValue(id))).go();
  }

  Future<List<GoalEntryEntity>> getGoalEntriesByGoal(String goalId) {
    return (select(goalEntries)..where((t) => t.goalId.equals(goalId))).get();
  }
}

extension GuidedJournalQuery on AppDatabase {
  Future<GuidedJournalEntity?> getGuidedJournal(String id) {
    return (select(guidedJournals)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<GuidedJournalEntity>> getAllGuidedJournals() {
    return (select(guidedJournals)).get();
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
  Future<UserEntity?> getUser(String userId) {
    return (select(users)..where((t) => t.id.equals(userId))).getSingleOrNull();
  }

  Future<int> insertUser(md.UserModel user) {
    return into(users).insertOnConflictUpdate(UsersCompanion(
      id: Value(user.userId),
      email: Value(user.email),
      displayName: Value(user.displayName),
    ));
  }
}

extension JournalEntryQuery on AppDatabase {
  Future<List<JournalEntryEntity>> getJournalEntriesByUser(String userId) {
    return (select(journalEntries)
          ..where((t) => t.userId.equals(userId))
          ..orderBy([
            (u) =>
                OrderingTerm(expression: u.createdAt, mode: OrderingMode.desc)
          ]))
        .get();
  }

  Future<int> insertJournalEntry(md.JournalEntry item) {
    return into(journalEntries).insertOnConflictUpdate(JournalEntriesCompanion(
      id: Value(item.id),
      userId: Value(item.userId),
      createdAt: Value(item.createdAt),
      guidedJournal: Value(item.guidedJournal),
      title: Value(item.title),
      content: Value(item.content),
    ));
  }

  Future<void> deleteJournalEntry(String id) {
    // TODO: If the guided journal is 'Set a Goal', also delete from GoalEntries
    return (delete(journalEntries)..where((t) => t.id.isValue(id))).go();
  }
}
