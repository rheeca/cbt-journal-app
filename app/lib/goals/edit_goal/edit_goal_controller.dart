import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:flutter/material.dart';

class EditGoalController extends ChangeNotifier {
  EditGoalController({required AppDatabase database}) : _database = database;

  final AppDatabase _database;

  bool _loading = false;
  bool get loading => _loading;

  Goal? _selectedGoal;
  Goal? get selectedGoal => _selectedGoal;
  set selectedGoal(Goal? goal) {
    _selectedGoal = goal;
    notifyListeners();
  }

  JournalEntry? _setGoalJournal;
  JournalEntry? get setGoalJournal => _setGoalJournal;
  set setGoalJournal(JournalEntry? journal) {
    _setGoalJournal = journal;
    notifyListeners();
  }

  Future<void> load({String? goalId, String? journalId}) async {
    _loading = true;
    notifyListeners();

    if (goalId != null) {
      _selectedGoal = await _database.getGoalById(goalId);
    }

    if (journalId != null) {
      _setGoalJournal = await _database.getJournalEntryById(journalId);
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> insertGoalInDb({Goal? goal}) async {
    if (goal != null) {
      await _database.insertGoal(goal);
    } else if (_selectedGoal != null) {
      await _database.insertGoal(_selectedGoal!);
    }
  }

  void updateGoal(List<bool> selectedDays, String title) {
    final List<DayOfWeek> notificationSchedule = [];
    for (int i = 0; i < selectedDays.length; i++) {
      if (selectedDays[i] == true) {
        notificationSchedule.add(DayOfWeek.values[i]);
      }
    }
    _selectedGoal?.title = title;
    _selectedGoal?.notificationSchedule.clear();
    _selectedGoal?.notificationSchedule.addAll(notificationSchedule);
  }
}
