import 'package:grpc/grpc.dart';
import 'package:journal_service/generated/user.pbgrpc.dart';

class UserService extends UserServiceBase {
  @override
  Future<ReadUsersResponse> readUsers(
      ServiceCall call, ReadUsersRequest request) async {
    print('Received read user request: $request');
    return ReadUsersResponse();
  }

  @override
  Future<WriteUsersResponse> writeUsers(
      ServiceCall call, WriteUsersRequest request) async {
    print('Received write user request: $request');
    return WriteUsersResponse();
  }
}
