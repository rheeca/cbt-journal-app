import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:cbt_journal/user/user_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class GoalsController extends ChangeNotifier {
  GoalsController();

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
      _journalEntries.addAll(di<JournalController>()
          .journalEntries
          .where((e) => goal.journalEntries.contains(e.id)));
    }
    notifyListeners();
  }

  final List<JournalEntry> _journalEntries = [];
  List<JournalEntry> get journalEntries => List.unmodifiable(_journalEntries);

  JournalEntry? _currentJournal;
  JournalEntry? get currentJournal => _currentJournal;
  set currentJournal(JournalEntry? journal) {
    _currentJournal = journal;
    notifyListeners();
  }

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    await loadGoals();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadGoals() async {
    final user = di<UserController>().currentUser;
    if (user == null) {
      return;
    }

    final userId = user.userId;
    final userGoals = await di<AppDatabase>().getGoalsByUser(userId);

    _goals.clear();
    _goals.addAll(userGoals);

    if (_goals.isEmpty) {
      _selectedGoal = null;
    }

    if (_selectedGoal != null) {
      _selectedGoal = _goals.firstWhereOrNull((e) => e.id == _selectedGoal!.id);

      if (_selectedGoal != null) {
        _journalEntries.clear();
        _journalEntries.addAll(di<JournalController>()
            .journalEntries
            .where((e) => _selectedGoal!.journalEntries.contains(e.id)));
      }
    }

    notifyListeners();
  }
}
