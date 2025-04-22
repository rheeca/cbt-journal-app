import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/generated/user.pb.dart' as pb_user;
import 'package:cbt_journal/models/model.dart';
import 'package:cbt_journal/user/user_controller.dart';
import 'package:cbt_journal/util/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class HomeController extends ChangeNotifier {
  HomeController({required AppDatabase database}) : _database = database;

  final AppDatabase _database;

  bool _loading = false;
  bool get loading => _loading;

  pb_user.User? _currentUser;
  pb_user.User? get currentUser => _currentUser;

  final List<Goal> _goals = [];
  List<Goal> get goals => _goals;

  GoalCheckIn? _goalCheckIns;
  GoalCheckIn? get goalCheckIns => _goalCheckIns;

  final List<GuidedJournal> _guidedJournals = [];
  List<GuidedJournal> get guidedJournals => List.unmodifiable(_guidedJournals);

  Future<void> load() async {
    _loading = true;
    notifyListeners();

    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      _loading = false;
      notifyListeners();
      return;
    }

    _currentUser = (await _database.getUsers([userId])).firstOrNull;
    if (_currentUser != null) {
      di<UserController>().registered = true;
    }

    final goals = await _database.getGoals(userId: userId);
    _goals.clear();
    _goals.addAll(goals);

    final dateToday = dateOnlyUtc(DateTime.now().toUtc());
    _goalCheckIns =
        (await _database.getGoalCheckIns(userId: userId, dates: [dateToday]))
            .firstOrNull;
    _goalCheckIns ??= GoalCheckIn(
      userId: userId,
      date: dateToday,
      goals: {},
      updatedAt: DateTime.now().toUtc(),
      isDeleted: false,
    );

    final guidedJournals = await _database.getAllGuidedJournals();
    _guidedJournals.clear();
    _guidedJournals.addAll(guidedJournals);

    _loading = false;
    notifyListeners();
  }

  Future<void> createProfile(pb_user.User user) async {
    _loading = true;
    notifyListeners();

    await _database.insertUsers([user]);
    _currentUser = user;
    di<UserController>().registered = true;

    _loading = false;
    notifyListeners();
  }

  Future<void> updateGoalCheckIns(GoalCheckIn checkIn) async {
    final updatedCheckIn = GoalCheckIn(
      userId: checkIn.userId,
      date: checkIn.date,
      goals: checkIn.goals,
      updatedAt: DateTime.now().toUtc(),
      isDeleted: checkIn.isDeleted,
    );

    _goalCheckIns = updatedCheckIn;
    await _database.insertGoalCheckIns([updatedCheckIn]);
    notifyListeners();
  }
}
