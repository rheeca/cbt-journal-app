import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:logger/logger.dart';
import 'package:cbt_journal/models/model.dart' as md;
import 'tables.dart';

part 'database.g.dart';

var logger = Logger();

@DriftDatabase(tables: [GuidedJournals, JournalEntries, Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'cbt_journal_database'));

  @override
  int get schemaVersion => 1;

  Future<GuidedJournalEntity?> getGuidedJournal(String id) {
    return (select(guidedJournals)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertGuidedJournal(md.GuidedJournal gj) {
    return into(guidedJournals).insertOnConflictUpdate(GuidedJournalsCompanion(
      id: Value(gj.id),
      title: Value(gj.title),
      guideQuestions: Value(gj.guideQuestions),
      description: Value(gj.description),
      journalType: Value(gj.journalType.name),
    ));
  }

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
