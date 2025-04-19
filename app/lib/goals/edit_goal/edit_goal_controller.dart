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

  GuidedJournal? _setGoalGuidedJournal;
  GuidedJournal? get setGoalGuidedJournal => _setGoalGuidedJournal;

  final List<TextEditingController> _textControllers = [];
  List<TextEditingController> get textControllers => _textControllers;

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

  Future<void> load({String? goalId}) async {
    _loading = true;
    notifyListeners();

    _selectedGoal = null;
    _selectedGoalActivity = null;
    _textControllers.clear();
    _selectedDays.clear();

    _setGoalGuidedJournal =
        await _database.getGuidedJournalByTitle('Set a Goal');

    if (goalId != null) {
      _selectedGoal = (await _database.getGoals(ids: [goalId])).firstOrNull;
      for (int i = 0; i < _selectedGoal!.guideQuestions.length; i++) {
        _textControllers.add(TextEditingController(
            text: _selectedGoal!.guideQuestions[i].answer));
      }
      _selectedGoalActivity = _selectedGoal?.type;
      _selectedDays.addAll(_selectedGoal?.notificationSchedule ?? []);
    } else {
      _textControllers.addAll(List.generate(
          _setGoalGuidedJournal!.guideQuestions.length,
          (_) => TextEditingController()));
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> insertGoalInDb() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final List<GuideQuestion> guideQuestions = [];
    for (int i = 0; i < _textControllers.length; i++) {
      guideQuestions.add(GuideQuestion(
        question: _setGoalGuidedJournal!.guideQuestions[i],
        answer: _textControllers[i].text,
      ));
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
      _selectedGoal!.guideQuestions = guideQuestions;
      _selectedGoal!.updatedAt = DateTime.now();
    }
    await _database.insertGoals([_selectedGoal!]);
  }
}
