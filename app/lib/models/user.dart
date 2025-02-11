import 'package:uuid/uuid.dart';

class UserModel {
  String userId;
  String email;
  String displayName;

  UserModel(
      {required this.userId, required this.email, required this.displayName});
  UserModel.createNew({required this.email, this.displayName = ''})
      : userId = const Uuid().v4();
}
