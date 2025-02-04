import 'package:flutter/material.dart';
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

class CurrentUser extends ChangeNotifier {
  UserModel? _user;

  String get userId => _user!.userId;
  String get email => _user!.email;
  String get displayName => _user!.displayName;

  set userId(String value) {
    _user?.userId = value;
    notifyListeners();
  }

  set email(String value) {
    _user?.email = value;
    notifyListeners();
  }

  set displayName(String value) {
    _user?.displayName = value;
    notifyListeners();
  }

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  CurrentUser();
}
