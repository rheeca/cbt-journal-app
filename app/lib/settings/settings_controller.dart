import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsController extends ChangeNotifier {
  SettingsController({required AppDatabase database}) : _database = database;

  final AppDatabase _database;

  bool _loading = false;
  bool get loading => _loading;

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  Future<void> load() async {
    _loading = true;
    notifyListeners();

    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      _currentUser = await _database.getUser(userId);
    } else {
      _currentUser = null;
    }

    _loading = false;
    notifyListeners();
  }

  void insertUserIntoDb(UserModel user) {
    _currentUser = user;
    _database.insertUser(user);
  }
}
