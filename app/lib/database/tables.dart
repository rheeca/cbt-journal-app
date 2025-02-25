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
  TextColumn get content => text().map(const QuestionListConverter())();

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

@DataClassName("GoalEntity")
class Goals extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  TextColumn get title => text().withLength(min: 1, max: 200)();
  TextColumn get guideQuestions => text().map(const QuestionListConverter())();
  TextColumn get notificationSchedule =>
      text().map(const StringListConverter())();
  BoolColumn get isArchived => boolean().clientDefault(() => false)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName("GoalEntryEntity")
class GoalEntries extends Table {
  TextColumn get journalEntryId => text().references(JournalEntries, #id)();
  TextColumn get goalId => text().references(Goals, #id)();

  @override
  Set<Column> get primaryKey => {journalEntryId};
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

class QuestionListConverter
    extends TypeConverter<List<Map<String, String>>, String> {
  const QuestionListConverter();

  @override
  List<Map<String, String>> fromSql(String fromDb) {
    List<dynamic> decoded = json.decode(fromDb);

    return decoded
        .cast<Map<String, dynamic>>()
        .map((e) => e.map((key, value) => MapEntry(key, value.toString())))
        .toList();
  }

  @override
  String toSql(List<Map<String, String>> value) {
    return json.encode(value);
  }
}
