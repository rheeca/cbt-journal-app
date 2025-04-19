import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/generated/user.pb.dart' as pb_user;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsController extends ChangeNotifier {
  SettingsController({required AppDatabase database}) : _database = database;

  final AppDatabase _database;

  bool _loading = false;
  bool get loading => _loading;

  pb_user.User? _currentUser;
  pb_user.User? get currentUser => _currentUser;

  Future<void> load() async {
    _loading = true;
    notifyListeners();

    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      _currentUser = (await _database.getUsers([userId])).firstOrNull;
    } else {
      _currentUser = null;
    }

    _loading = false;
    notifyListeners();
  }

  void insertUserIntoDb(pb_user.User user) {
    _currentUser = user;
    _database.insertUsers([user]);
  }
}
