import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:cbt_journal/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class GoalsController extends ChangeNotifier {
  GoalsController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<Goal> _goals = [];
  List<Goal> get goals => _goals;

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    loadGoals();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadGoals() async {
    final userId = di<UserController>().currentUser!.userId;
    final userGoals = await di<AppDatabase>().getGoalsByUser(userId);

    _goals.clear();
    _goals.addAll(userGoals);

    notifyListeners();
  }
}
