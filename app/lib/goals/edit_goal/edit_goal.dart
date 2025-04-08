import 'package:cbt_journal/goals/edit_goal/edit_goal_controller.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_it/watch_it.dart';

class EditGoalScreen extends StatefulWidget with WatchItStatefulWidgetMixin {
  const EditGoalScreen({super.key, this.goalId});

  final String? goalId;

  @override
  State<EditGoalScreen> createState() => _EditGoalScreenState();
}

class _EditGoalScreenState extends State<EditGoalScreen> {
  _EditGoalScreenState();

  int _selectedIndex = 0;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    await di<EditGoalController>().load(goalId: widget.goalId);
    final guideQuestions =
        di<EditGoalController>().setGoalGuidedJournal!.guideQuestions;
    final textControllers = di<EditGoalController>().textControllers;
    _pages.addAll([
      const _SelectGoal(),
      ...List.generate(
        guideQuestions.length,
        (index) => _TextInput(guideQuestions[index], textControllers[index]),
      ),
      const _SelectFrequency(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final loading = watchPropertyValue((EditGoalController c) => c.loading);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (_selectedIndex > 0) {
                setState(() {
                  _selectedIndex -= 1;
                });
              } else {
                context.pop();
              }
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: !loading ? _pages[_selectedIndex] : const SizedBox(),
      ),
      floatingActionButton: (_selectedIndex < _pages.length - 1)
          ? FloatingActionButton(
              onPressed: () async {
                setState(() {
                  _selectedIndex += 1;
                });
              },
              child: const Icon(Icons.arrow_forward),
            )
          : null,
    );
  }
}

class _SelectGoal extends StatefulWidget with WatchItStatefulWidgetMixin {
  const _SelectGoal();

  @override
  State<_SelectGoal> createState() => _SelectGoalState();
}

class _SelectGoalState extends State<_SelectGoal> {
  @override
  Widget build(BuildContext context) {
    final selectedGoalActivity =
        watchPropertyValue((EditGoalController c) => c.selectedGoalActivity);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Select a Goal'),
        const SizedBox(height: 12),
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: GoalActivity.values
                .map((e) => Card(
                      child: InkWell(
                        onTap: () {
                          if (selectedGoalActivity != e) {
                            di<EditGoalController>().selectedGoalActivity = e;
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: selectedGoalActivity == e
                                ? Theme.of(context)
                                    .primaryColor
                                    .withValues(alpha: 0.3)
                                : null,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                e.icon,
                                size: 48.0,
                              ),
                              Text(e.label),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _SelectFrequency extends StatefulWidget with WatchItStatefulWidgetMixin {
  const _SelectFrequency();

  @override
  State<_SelectFrequency> createState() => _SelectFrequencyState();
}

class _SelectFrequencyState extends State<_SelectFrequency> {
  _SelectFrequencyState();

  Frequency? _frequency;

  @override
  Widget build(BuildContext context) {
    final selectedDays =
        watchPropertyValue((EditGoalController c) => c.selectedDays);
    final selected = {...selectedDays};

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('How often do you want to check-in?'),
          const SizedBox(height: 24.0),
          Center(
            child: ToggleButtons(
              onPressed: (int index) {
                _frequency = null;
                final day = DayOfWeek.values[index];
                if (selected.contains(day)) {
                  selected.remove(day);
                } else {
                  selected.add(day);
                }
                di<EditGoalController>().selectedDays = selected;
                // TODO: notifyListeners doesn't work for this one, so manually
                // trigger rebuild for now
                setState(() {});
              },
              isSelected:
                  DayOfWeek.values.map((e) => selected.contains(e)).toList(),
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
                        _frequency = value;
                        di<EditGoalController>().selectedDays =
                            value?.days ?? {};
                        setState(() {});
                      }))
                  .toList()),
          const SizedBox(height: 40.0),
          Center(
            child: FilledButton(
              onPressed: () async {
                await di<EditGoalController>().insertGoalInDb();
                // TODO: Loading indicator until goal is saved
                if (context.mounted) context.pop(true);
              },
              child: const Text('Save Goal'),
            ),
          )
        ],
      ),
    );
  }
}

class _TextInput extends WatchingWidget {
  const _TextInput(this.guideQuestion, this.contentController);
  final String guideQuestion;
  final TextEditingController contentController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 64.0),
      child: Column(
        children: [
          Text(guideQuestion),
          const SizedBox(height: 12.0),
          Expanded(
              child: TextField(
            controller: contentController,
            maxLines: null,
            decoration: null,
          )),
        ],
      ),
    );
  }
}

enum Frequency {
  daily(label: 'Daily', days: {
    DayOfWeek.monday,
    DayOfWeek.tuesday,
    DayOfWeek.wednesday,
    DayOfWeek.thursday,
    DayOfWeek.friday,
    DayOfWeek.saturday,
    DayOfWeek.sunday,
  }),
  weekdays(label: 'Weekdays', days: {
    DayOfWeek.monday,
    DayOfWeek.tuesday,
    DayOfWeek.wednesday,
    DayOfWeek.thursday,
    DayOfWeek.friday
  }),
  weekends(label: 'Weekends', days: {DayOfWeek.saturday, DayOfWeek.sunday});

  const Frequency({required this.label, required this.days});
  final String label;
  final Set<DayOfWeek> days;
}

enum GoalActivity {
  exercise('Exercise', Icons.fitness_center),
  study('Study', Icons.class_),
  eatHealthy('Eat Healthy', Icons.restaurant),
  sleepBetter('Sleep Better', Icons.hotel),
  music('Music', Icons.music_note),
  cook('Cook', Icons.bento);

  const GoalActivity(this.label, this.icon);
  final String label;
  final IconData icon;

  static GoalActivity? getByName(String name) {
    return GoalActivity.values.firstWhereOrNull((e) => e.name == name);
  }
}
