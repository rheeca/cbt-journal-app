import 'package:cbt_journal/database/database.dart' show UserEntity;
import 'package:flutter/material.dart';

class CurrentUserModel extends ChangeNotifier {
  String get userId => _userId;
  String get email => _email;
  String get displayName => _displayName;
  String _userId = '';
  String _email = '';
  String _displayName = '';

  set userId(String value) {
    _userId = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set displayName(String value) {
    _displayName = value;
    notifyListeners();
  }

  void setUser(UserEntity user) {
    _userId = user.id;
    _email = user.email;
    _displayName = user.displayName;
    notifyListeners();
  }
}
