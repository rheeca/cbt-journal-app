import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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

    final db = di<AppDatabase>();

    // TODO: user login
    await dotenv.load(fileName: ".env");
    final user = await db.getUser(dotenv.env['USER_ID'] ?? '');

    if (user != null) {
      _currentUser = UserModel(
          userId: user.id, email: user.email, displayName: user.displayName);
    }

    _isLoading = false;
    notifyListeners();
  }
}
