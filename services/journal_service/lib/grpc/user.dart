import 'package:grpc/grpc.dart';
import 'package:journal_service/generated/user.pbgrpc.dart';

class UserService extends UserServiceBase {
  @override
  Future<LoginResponse> login(ServiceCall call, LoginRequest request) async {
    return LoginResponse();
  }
}
