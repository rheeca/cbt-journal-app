import 'package:flutter/material.dart';

class CurrentUserModel extends ChangeNotifier {
  String get userId => _userId;
  String get displayName => _displayName;
  String _userId = '123456';
  String _displayName = 'Alice';

  set userId(String value) {
    _userId = value;
    notifyListeners();
  }

  set displayName(String value) {
    _displayName = value;
    notifyListeners();
  }
}
