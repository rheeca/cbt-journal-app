import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoalsController extends ChangeNotifier {
  GoalsController({required AppDatabase database}) : _database = database;

  final AppDatabase _database;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<Goal> _goals = [];
  List<Goal> get goals => _goals;

  Goal? _selectedGoal;
  Goal? get selectedGoal => _selectedGoal;
  set selectedGoal(Goal? goal) {
    _selectedGoal = goal;

    if (goal != null) {
      _journalEntries.clear();
      _journalEntries.addAll(
          _allJournalEntries.where((e) => goal.journalEntries.contains(e.id)));
    }
    notifyListeners();
  }

  final List<JournalEntry> _allJournalEntries = [];

  final List<JournalEntry> _journalEntries = [];
  List<JournalEntry> get journalEntries => List.unmodifiable(_journalEntries);

  GuidedJournal? _setGoalGuidedJournal;
  GuidedJournal? get setGoalGuidedJournal => _setGoalGuidedJournal;

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      _isLoading = false;
      notifyListeners();
      return;
    }

    final goals = await _database.getGoalsByUser(userId);
    _goals.clear();
    _goals.addAll(goals);

    final journalEntries = await _database.getJournalEntriesByUser(userId);
    _allJournalEntries.clear();
    _allJournalEntries.addAll(journalEntries);

    _setGoalGuidedJournal =
        await _database.getGuidedJournalByTitle('Set a Goal');

    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteGoal(String goalId) async {
    await _database.deleteGoal(goalId);
    _goals.removeWhere((e) => e.id == goalId);
  }
}
