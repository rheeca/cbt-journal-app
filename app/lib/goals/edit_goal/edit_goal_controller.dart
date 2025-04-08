import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/goals/edit_goal/edit_goal.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  GoalActivity? _selectedGoalActivity;
  GoalActivity? get selectedGoalActivity => _selectedGoalActivity;
  set selectedGoalActivity(GoalActivity? value) {
    _selectedGoalActivity = value;
    notifyListeners();
  }

  final Set<DayOfWeek> _selectedDays = {};
  Set<DayOfWeek> get selectedDays => _selectedDays;
  set selectedDays(Set<DayOfWeek> value) {
    _selectedDays.clear();
    _selectedDays.addAll(value);
    notifyListeners();
  }

  Future<void> load({String? goalId, String? journalId}) async {
    _loading = true;
    notifyListeners();

    if (goalId != null) {
      _selectedGoal = await _database.getGoalById(goalId);
      _selectedGoalActivity = _selectedGoal?.type;
      _selectedDays.addAll(_selectedGoal?.notificationSchedule ?? []);
    }

    if (journalId != null) {
      _setGoalJournal = await _database.getJournalEntryById(journalId);
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> insertGoalInDb() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final List<GuideQuestion> guideQuestions = [];
    if (_setGoalJournal != null) {
      guideQuestions.addAll(_setGoalJournal!.content);
    }

    if (_selectedGoalActivity == null) {
      return;
    }

    if (_selectedGoal == null) {
      _selectedGoal = Goal.createNew(
        userId: userId,
        type: _selectedGoalActivity!,
        guideQuestions: guideQuestions,
        notificationSchedule: _selectedDays.toList(),
        journalEntries: [],
      );
    } else {
      _selectedGoal!.type = _selectedGoalActivity!;
      _selectedGoal!.notificationSchedule = _selectedDays.toList();
    }
    await _database.insertGoal(_selectedGoal!);
  }
}
