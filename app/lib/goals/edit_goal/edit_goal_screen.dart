import 'package:cbt_journal/goals/edit_goal/create_goal.dart';
import 'package:cbt_journal/goals/edit_goal/edit_goal_controller.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class EditGoalScreen extends StatefulWidget with WatchItStatefulWidgetMixin {
  const EditGoalScreen({super.key, required this.goalId});

  final String goalId;

  @override
  State<EditGoalScreen> createState() => _EditGoalScreenState();
}

class _EditGoalScreenState extends State<EditGoalScreen> {
  late final TextEditingController titleController;
  Frequency? _frequency;
  final List<bool> _selectedDays = DayOfWeek.values.map((e) => false).toList();

  @override
  void initState() {
    super.initState();
    _load();
    titleController = TextEditingController();
  }

  void _load() async {
    await di<EditGoalController>().load(goalId: widget.goalId);
  }

  @override
  Widget build(BuildContext context) {
    final loading = watchPropertyValue((EditGoalController c) => c.loading);
    if (loading) {
      return LoadingAnimationWidget.waveDots(
        color: Colors.blueGrey,
        size: 50,
      );
    }

    final selectedGoal =
        watchPropertyValue((EditGoalController c) => c.selectedGoal);

    if (selectedGoal != null) {
      titleController.text = selectedGoal.title;
      for (final i in selectedGoal.notificationSchedule) {
        _selectedDays[i.index] = true;
      }
    }
    if (selectedGoal == null) {
      return const SizedBox();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () async {
              di<EditGoalController>()
                  .updateGoal(_selectedDays, titleController.text);
              await di<EditGoalController>().insertGoalInDb();

              if (context.mounted) context.pop(true);
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
              autofocus: true,
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
                  di<EditGoalController>()
                      .updateGoal(_selectedDays, titleController.text);
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
                          di<EditGoalController>()
                              .updateGoal(_selectedDays, titleController.text);
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
                children: selectedGoal.guideQuestions.map((e) {
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
