import 'package:cbt_journal/goals/goals_controller.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:flutter/material.dart';
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
          FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, '/journal-entry/create',
                    arguments: goalJournal);
              },
              child: const Text('Create a Goal')),
          const SizedBox(height: 24.0),
          const _GoalsListView(),
        ],
      ),
    );
  }
}

class _GoalsListView extends StatelessWidget with WatchItMixin {
  const _GoalsListView();

  @override
  Widget build(BuildContext context) {
    final goals = watchPropertyValue((GoalsController c) => c.goals);

    if (goals.isEmpty) {
      return const SizedBox();
    } else {
      return ConstrainedBox(
        // TODO: ListView should fill up remaining space
        // in screen instead of having a specific height
        constraints: const BoxConstraints(maxHeight: 300.0),
        child: ListView(
          children: goals
              .map(
                (e) => Card(
                  child: Text(e.title),
                ),
              )
              .toList(),
        ),
      );
    }
  }
}
