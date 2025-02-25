import 'package:cbt_journal/goals/goals_controller.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class GoalsScreen extends StatefulWidget with WatchItStatefulWidgetMixin {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    final goalJournal = di<JournalController>()
        .guidedJournals
        .firstWhere((e) => e.title == 'Set a Goal');

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FilledButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/journal-entry/create',
                    arguments: goalJournal);
              },
              icon: const Icon(Icons.add),
              label: const Text('Create a Goal')),
          const SizedBox(height: 24.0),
          const Expanded(child: _GoalsListView()),
        ],
      ),
    );
  }
}

class _GoalsListView extends StatelessWidget with WatchItMixin {
  const _GoalsListView();

  @override
  Widget build(BuildContext context) {
    final isLoadingGoals =
        watchPropertyValue((GoalsController c) => c.isLoading);
    final goals = watchPropertyValue((GoalsController c) => c.goals);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: isLoadingGoals
          ? LoadingAnimationWidget.waveDots(
              color: Colors.blueGrey,
              size: 50,
            )
          : ListView(
              children: goals
                  .map(
                    (e) => Card(
                      child: InkWell(
                        onTap: () {
                          di<GoalsController>().selectedGoal = e;
                          Navigator.pushNamed(context, '/goal/view');
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                          child: Text(
                            e.title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
