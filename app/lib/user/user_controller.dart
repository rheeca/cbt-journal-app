import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class UserController extends ChangeNotifier {
  UserController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      final db = di<AppDatabase>();
      final user = await db.getUser(firebaseUser.uid);

      if (user != null) {
        _currentUser = UserModel(
            userId: user.id, email: user.email, displayName: user.displayName);
      }
    }

    _isLoading = false;
    notifyListeners();
  }
}
