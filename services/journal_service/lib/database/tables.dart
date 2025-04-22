import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';

@DataClassName("GoalCheckInEntity")
class GoalCheckIns extends Table {
  TextColumn get userId => text().references(
        Users,
        #id,
        onDelete: KeyAction.cascade,
      )();
  Column<PgDateTime> get date => customType(PgTypes.timestampWithTimezone)();
  TextColumn get goals => text().map(const StringSetConverter())();
  Column<PgDateTime> get updatedAt =>
      customType(PgTypes.timestampWithTimezone)();
  BoolColumn get isDeleted => boolean()();

  @override
  Set<Column> get primaryKey => {userId, date};
}

@DataClassName("GoalEntity")
class Goals extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(
        Users,
        #id,
        onDelete: KeyAction.cascade,
      )();
  Column<PgDateTime> get createdAt =>
      customType(PgTypes.timestampWithTimezone)();
  TextColumn get title => text()();
  TextColumn get type => text()();
  TextColumn get guideQuestions => text().map(const QuestionListConverter())();
  TextColumn get notificationSchedule =>
      text().map(const StringListConverter())();
  BoolColumn get isArchived => boolean().clientDefault(() => false)();
  Column<PgDateTime> get updatedAt =>
      customType(PgTypes.timestampWithTimezone)();
  BoolColumn get isDeleted => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName("JournalEntryEntity")
class JournalEntries extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(
        Users,
        #id,
        onDelete: KeyAction.cascade,
      )();
  Column<PgDateTime> get createdAt =>
      customType(PgTypes.timestampWithTimezone)();
  TextColumn get guidedJournal => text()();
  TextColumn get title => text()();
  TextColumn get content => text().map(const QuestionListConverter())();
  Column<PgDateTime> get updatedAt =>
      customType(PgTypes.timestampWithTimezone)();
  BoolColumn get isDeleted => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName("UserEntity")
class Users extends Table {
  TextColumn get id => text()();
  TextColumn get email => text().unique()();
  Column<PgDateTime> get createdAt =>
      customType(PgTypes.timestampWithTimezone)();
  TextColumn get displayName => text()();
  Column<PgDateTime> get updatedAt =>
      customType(PgTypes.timestampWithTimezone)();
  BoolColumn get isDeleted => boolean()();

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

class StringSetConverter extends TypeConverter<Set<String>, String> {
  const StringSetConverter();

  @override
  Set<String> fromSql(String fromDb) {
    return Set<String>.from(json.decode(fromDb));
  }

  @override
  String toSql(Set<String> value) {
    return json.encode(value.toList());
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
