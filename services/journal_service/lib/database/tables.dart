import 'package:drift/drift.dart';

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
