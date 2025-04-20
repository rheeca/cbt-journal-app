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
  Future<List<md.Goal>> getGoals({
    String? userId,
    List<String>? ids,
    bool includeDeleted = false,
  }) async {
    final List<md.Goal> resp = [];

    SimpleSelectStatement<Goals, GoalEntity> stmt = select(goals);
    if (userId != null) {
      stmt.where((t) => t.userId.equals(userId));
    } else if (ids != null) {
      stmt.where((t) => t.id.isIn(ids));
    }

    if (!includeDeleted) {
      stmt.where((t) => t.isDeleted.equals(false));
    }

    final goalsFromDb = await stmt.get();
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
        updatedAt: g.updatedAt,
        isDeleted: g.isDeleted,
      ));
    }
    return resp;
  }

  Future<void> insertGoals(
    List<md.Goal> items, {
    bool toSync = true,
  }) {
    if (toSync) {
      for (final i in items) {
        insertSyncLog(md.SyncLog(i.id, DatabaseType.goal));
      }
    }

    return batch((batch) {
      batch.insertAll(
          goals,
          items.map((e) => GoalsCompanion(
                id: Value(e.id),
                userId: Value(e.userId),
                createdAt: Value(e.createdAt),
                title: Value(e.title),
                type: Value(e.type.name),
                guideQuestions:
                    Value(e.guideQuestions.map((e) => e.toMap()).toList()),
                notificationSchedule:
                    Value(e.notificationSchedule.map((e) => e.name).toList()),
                isArchived: Value(e.isArchived),
                updatedAt: Value(e.updatedAt),
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

  Future<void> deleteGoal(String id) {
    insertSyncLog(md.SyncLog(id, DatabaseType.goal));

    return (update(goals)..where((t) => t.id.equals(id))).write(
      GoalsCompanion(
        updatedAt: Value(DateTime.now().toUtc()),
        isDeleted: const Value(true),
      ),
    );
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

  Future<List<md.GoalCheckIn>> getGoalCheckIns({
    required String userId,
    List<DateTime>? dates,
    bool includeDeleted = false,
  }) async {
    SimpleSelectStatement<GoalCheckIns, GoalCheckInEntity> stmt =
        select(goalCheckIns)..where((t) => t.userId.equals(userId));
    if (dates != null) {
      stmt.where((t) => t.date.isIn(dates));
    }

    if (!includeDeleted) {
      stmt.where((t) => t.isDeleted.equals(false));
    }

    final items = await stmt.get();
    return items
        .map((e) => md.GoalCheckIn(
              userId: e.userId,
              date: e.date,
              goals: e.goals,
              updatedAt: e.updatedAt,
              isDeleted: e.isDeleted,
            ))
        .toList();
  }

  Future<void> insertGoalCheckIns(
    List<md.GoalCheckIn> items, {
    bool toSync = true,
  }) {
    if (toSync) {
      for (final i in items) {
        insertSyncLog(
            md.SyncLog('${i.userId}+${i.date}', DatabaseType.goalCheckIn));
      }
    }

    return batch((batch) {
      batch.insertAll(
          goalCheckIns,
          items.map((e) => GoalCheckInsCompanion(
                userId: Value(e.userId),
                date: Value(e.date),
                goals: Value(e.goals),
                updatedAt: Value(e.updatedAt),
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
  Future<List<User>> getUsers(
    List<String> ids, {
    bool includeDeleted = false,
  }) async {
    SimpleSelectStatement<Users, UserEntity> stmt = select(users)
      ..where((t) => t.id.isIn(ids));
    if (!includeDeleted) {
      stmt.where((t) => t.isDeleted.equals(false));
    }

    final items = await stmt.get();
    return items
        .map((e) => User(
              id: e.id,
              email: e.email,
              createdAt: e.createdAt.toProtoTimestamp(),
              displayName: e.displayName,
              updatedAt: e.updatedAt.toProtoTimestamp(),
              isDeleted: e.isDeleted,
            ))
        .toList();
  }

  Future<void> insertUsers(
    List<User> items, {
    bool toSync = true,
  }) async {
    if (toSync) {
      for (final i in items) {
        insertSyncLog(md.SyncLog(i.id, DatabaseType.user));
      }
    }

    await batch((batch) {
      batch.insertAll(
          users,
          items.map(
            (e) => UsersCompanion(
              id: Value(e.id),
              email: Value(e.email),
              createdAt: Value(e.createdAt.toDateTime()),
              displayName: Value(e.displayName),
              updatedAt: Value(e.updatedAt.toDateTime()),
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

  Future<void> deleteUser(String id) {
    insertSyncLog(md.SyncLog(id, DatabaseType.user));

    return (update(users)..where((t) => t.id.equals(id))).write(
      UsersCompanion(
        updatedAt: Value(DateTime.now().toUtc()),
        isDeleted: const Value(true),
      ),
    );
  }
}

extension JournalEntryQuery on AppDatabase {
  Future<List<JournalEntry>> getJournalEntries({
    String? userId,
    List<String>? ids,
    bool includeDeleted = false,
  }) async {
    SimpleSelectStatement<JournalEntries, JournalEntryEntity> stmt =
        select(journalEntries);
    if (userId != null) {
      stmt
        ..where((t) => t.userId.equals(userId))
        ..orderBy([
          (u) => OrderingTerm(expression: u.createdAt, mode: OrderingMode.desc)
        ]);
    } else if (ids != null) {
      stmt.where((t) => t.id.isIn(ids));
    }

    if (!includeDeleted) {
      stmt.where((t) => t.isDeleted.equals(false));
    }

    final items = await stmt.get();
    return items
        .map((e) => JournalEntry(
              id: e.id,
              userId: e.userId,
              createdAt: e.createdAt,
              guidedJournal: e.guidedJournal,
              title: e.title,
              content: e.content.map((e) => GuideQuestion.fromMap(e)).toList(),
              updatedAt: e.updatedAt,
              isDeleted: e.isDeleted,
            ))
        .toList();
  }

  Future<void> insertJournalEntries(
    List<md.JournalEntry> items, {
    bool toSync = true,
  }) {
    if (toSync) {
      for (final i in items) {
        insertSyncLog(md.SyncLog(i.id, DatabaseType.journalEntry));
      }
    }

    return batch((batch) {
      batch.insertAll(
          journalEntries,
          items.map((e) => JournalEntriesCompanion(
                id: Value(e.id),
                userId: Value(e.userId),
                createdAt: Value(e.createdAt),
                guidedJournal: Value(e.guidedJournal),
                title: Value(e.title),
                content: Value(e.content.map((e) => e.toMap()).toList()),
                updatedAt: Value(e.updatedAt),
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

  Future<void> deleteJournalEntry(String id) {
    insertSyncLog(md.SyncLog(id, DatabaseType.journalEntry));

    return (update(journalEntries)..where((t) => t.id.equals(id))).write(
      JournalEntriesCompanion(
        updatedAt: Value(DateTime.now().toUtc()),
        isDeleted: const Value(true),
      ),
    );
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
