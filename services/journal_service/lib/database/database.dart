import 'package:dotenv/dotenv.dart';
import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:journal_service/generated/user.pbgrpc.dart';
import 'package:journal_service/utils/util.dart';
import 'package:postgres/postgres.dart';

import 'tables.dart';
part 'database.g.dart';

var env = DotEnv(includePlatformEnvironment: true)..load();

@DriftDatabase(tables: [Users])
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
