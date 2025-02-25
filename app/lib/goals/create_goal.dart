import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/goals/goals_controller.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:cbt_journal/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class CreateGoalScreen extends StatefulWidget {
  const CreateGoalScreen({super.key});

  @override
  State<CreateGoalScreen> createState() => _CreateGoalScreenState();
}

class _CreateGoalScreenState extends State<CreateGoalScreen> {
  _CreateGoalScreenState();

  final titleController = TextEditingController();
  Frequency? _frequency;
  final List<bool> _selectedDays = DayOfWeek.values.map((e) => false).toList();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: titleController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
              ),
              const Text('How often do you want to check-in?'),
              const SizedBox(height: 24.0),
              Center(
                child: ToggleButtons(
                  onPressed: (int index) {
                    _frequency = null;
                    setState(() {
                      _selectedDays[index] = !_selectedDays[index];
                    });
                  },
                  isSelected: _selectedDays,
                  children: DayOfWeek.values
                      .map((e) => Text(e.singleLetter))
                      .toList(),
                ),
              ),
              const SizedBox(height: 24.0),
              Column(
                  children: Frequency.values
                      .map((e) => RadioListTile(
                          title: Text(e.label),
                          value: e,
                          groupValue: _frequency,
                          visualDensity: VisualDensity.compact,
                          onChanged: (Frequency? value) {
                            setState(() {
                              _frequency = value;
                              _selectedDays.fillRange(
                                  0, _selectedDays.length, false);
                              for (final i in e.days) {
                                _selectedDays[i.index] = true;
                              }
                            });
                          }))
                      .toList()),
              const SizedBox(height: 40.0),
              Center(
                child: FilledButton(
                  onPressed: () async {
                    final userId = di<UserController>().currentUser!.userId;
                    final List<DayOfWeek> notificationSchedule = [];
                    for (int i = 0; i < _selectedDays.length; i++) {
                      if (_selectedDays[i] == true) {
                        notificationSchedule.add(DayOfWeek.values[i]);
                      }
                    }
                    String title = titleController.text;
                    if (title == '') {
                      title = 'Title';
                    }

                    final List<GuideQuestion> guideQuestions = [];
                    JournalEntry? journalEntry =
                        di<GoalsController>().currentJournal;
                    if (journalEntry != null) {
                      guideQuestions.addAll(journalEntry.content);
                    }

                    final goal = Goal.createNew(
                        userId: userId,
                        title: title,
                        guideQuestions: guideQuestions,
                        notificationSchedule: notificationSchedule,
                        journalEntries: []);
                    await di<AppDatabase>().insertGoal(goal);
                    await di<GoalsController>().load();

                    // TODO: Loading indicator until goal is saved
                    if (context.mounted) Navigator.pop(context);
                  },
                  child: const Text('Create Goal'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum Frequency {
  daily(label: 'Daily', days: DayOfWeek.values),
  weekdays(label: 'Weekdays', days: [
    DayOfWeek.monday,
    DayOfWeek.tuesday,
    DayOfWeek.wednesday,
    DayOfWeek.thursday,
    DayOfWeek.friday
  ]),
  weekends(label: 'Weekends', days: [DayOfWeek.saturday, DayOfWeek.sunday]);

  const Frequency({required this.label, required this.days});
  final String label;
  final List<DayOfWeek> days;
}
