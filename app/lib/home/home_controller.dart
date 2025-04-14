import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:cbt_journal/util/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  HomeController({required AppDatabase database}) : _database = database;

  final AppDatabase _database;

  bool _loading = false;
  bool get loading => _loading;

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  bool _profileCreated = true;
  bool get profileCreated => _profileCreated;

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

    _currentUser = await _database.getUser(userId);
    if (_currentUser == null) _profileCreated = false;

    final goals = await _database.getGoalsByUser(userId);
    _goals.clear();
    _goals.addAll(goals);

    final dateToday = dateOnlyUtc(DateTime.now().toUtc());
    _goalCheckIns = await _database.getGoalCheckIn(userId, dateToday);
    _goalCheckIns ??= GoalCheckIn(userId: userId, date: dateToday, goals: {});

    final guidedJournals = await _database.getAllGuidedJournals();
    _guidedJournals.clear();
    _guidedJournals.addAll(guidedJournals);

    _loading = false;
    notifyListeners();
  }

  Future<void> createProfile(UserModel user) async {
    _loading = true;
    notifyListeners();

    await _database.insertUser(user);
    _currentUser = user;
    _profileCreated = true;

    _loading = false;
    notifyListeners();
  }

  Future<void> updateGoalCheckIns(GoalCheckIn checkIn) async {
    _goalCheckIns = checkIn;
    await _database.insertGoalCheckIn(checkIn);
    notifyListeners();
  }
}
