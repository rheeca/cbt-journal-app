import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  UserController();

  bool? _registered;
  bool? get registered => _registered;
  set registered(bool? value) {
    _registered = value;
    notifyListeners();
  }
}
