import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/goals/create_goal.dart';
import 'package:cbt_journal/goals/goals_controller.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class EditGoalScreen extends StatefulWidget with WatchItStatefulWidgetMixin {
  const EditGoalScreen({super.key});

  @override
  State<EditGoalScreen> createState() => _EditGoalScreenState();
}

class _EditGoalScreenState extends State<EditGoalScreen> {
  final titleController = TextEditingController();
  Goal? _selectedGoal;
  Frequency? _frequency;
  final List<bool> _selectedDays = DayOfWeek.values.map((e) => false).toList();

  @override
  void initState() {
    super.initState();
    _selectedGoal = di<GoalsController>().selectedGoal;

    if (_selectedGoal != null) {
      titleController.text = _selectedGoal!.title;
      for (final i in _selectedGoal!.notificationSchedule) {
        _selectedDays[i.index] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedGoal == null) {
      return const SizedBox();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () async {
              final List<DayOfWeek> notificationSchedule = [];
              for (int i = 0; i < _selectedDays.length; i++) {
                if (_selectedDays[i] == true) {
                  notificationSchedule.add(DayOfWeek.values[i]);
                }
              }
              _selectedGoal!.notificationSchedule = notificationSchedule;
              _selectedGoal!.title = titleController.text;

              await di<AppDatabase>().insertGoal(_selectedGoal!);
              await di<GoalsController>().load();
              if (context.mounted) Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
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
                children:
                    DayOfWeek.values.map((e) => Text(e.singleLetter)).toList(),
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
            const SizedBox(height: 24.0),
            Text('Description', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12.0),
            InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12.0,
                children: _selectedGoal!.guideQuestions.map((e) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.question,
                          style: Theme.of(context).textTheme.titleSmall),
                      Text(e.answer),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
