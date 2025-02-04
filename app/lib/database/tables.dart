import 'dart:convert';
import 'package:drift/drift.dart';

@DataClassName("GuidedJournalEntity")
class GuidedJournals extends Table {
  TextColumn get id => text()();
  TextColumn get title => text().unique()();
  TextColumn get guideQuestions => text().map(const StringListConverter())();
  TextColumn get description => text()();
  TextColumn get journalType => text().map(const StringListConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName("JournalEntryEntity")
class JournalEntries extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  TextColumn get guidedJournal => text().references(GuidedJournals, #id)();
  TextColumn get title => text().withLength(min: 1, max: 200).nullable()();
  TextColumn get content =>
      text().nullable().map(const StringListConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName("UserEntity")
class Users extends Table {
  TextColumn get id => text()();
  TextColumn get email => text().unique()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  TextColumn get displayName => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    return List<String>.from(json.decode(fromDb));
  }

  @override
  String toSql(List<String> value) {
    return json.encode(value);
  }
}
