import 'package:grpc/grpc.dart';
import 'package:journal_service/database/database.dart';
import 'package:journal_service/generated/user.pbgrpc.dart';

class UserService extends UserServiceBase {
  final database = AppDatabase();

  @override
  Future<ReadUsersResponse> readUsers(
      ServiceCall call, ReadUsersRequest request) async {
    final List<User> users = [];
    try {
      final res = await database.getUsers(request.ids);
      users.addAll(res);
    } catch (e) {
      return ReadUsersResponse(
        users: [],
      );
    }

    return ReadUsersResponse(users: users);
  }

  @override
  Future<WriteUsersResponse> writeUsers(
      ServiceCall call, WriteUsersRequest request) async {
    try {
      await database.insertUsers(request.users);
    } catch (e) {
      return WriteUsersResponse(
        status: 500,
        errorMessage: 'failed to insert users into database',
      );
    }

    return WriteUsersResponse(status: 200);
  }
}
