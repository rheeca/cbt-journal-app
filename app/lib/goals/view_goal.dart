import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/goals/goals_controller.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class ViewGoalScreen extends StatefulWidget with WatchItStatefulWidgetMixin {
  const ViewGoalScreen({super.key});

  @override
  State<ViewGoalScreen> createState() => _ViewGoalScreenState();
}

class _ViewGoalScreenState extends State<ViewGoalScreen> {
  @override
  Widget build(BuildContext context) {
    Goal? selectedGoal =
        watchPropertyValue((GoalsController c) => c.selectedGoal);
    if (selectedGoal == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Goal not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          MenuAnchor(
            menuChildren: [
              MenuItemButton(
                child: const Text('Edit'),
                onPressed: () {
                  Navigator.pushNamed(context, '/goal/edit');
                },
              ),
              MenuItemButton(
                child: const Text('Delete'),
                onPressed: () {
                  di<AppDatabase>().deleteGoal(selectedGoal.id);
                  di<GoalsController>().load();
                  Navigator.pop(context);
                },
              ),
            ],
            builder: (context, controller, child) => IconButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                icon: const Icon(Icons.more_horiz)),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 64.0),
        child: ListView(
          children: [
            Text(selectedGoal.title,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20.0),
            Text('Description', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12.0),
            Column(
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
            const SizedBox(height: 20.0),
            Text(
              'Journal Entries',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12.0),
            const Expanded(
              child: _JournalListView(),
            ),
          ],
        ),
      ),
    );
  }
}

class _JournalListView extends StatelessWidget with WatchItMixin {
  const _JournalListView();

  @override
  Widget build(BuildContext context) {
    final isLoadingGoals =
        watchPropertyValue((GoalsController c) => c.isLoading);
    final entries = watchPropertyValue((GoalsController c) => c.journalEntries);

    return Container(
      child: isLoadingGoals
          ? LoadingAnimationWidget.waveDots(
              color: Colors.blueGrey,
              size: 50,
            )
          : Column(
              children: entries
                  .map(
                    (e) => Card(
                      child: InkWell(
                        onTap: () async {
                          di<JournalController>().selectedJournalEntry = e;
                          await Navigator.pushNamed(
                              context, '/view-journal-entry');

                          di<JournalController>().selectedJournalEntry = null;
                        },
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.title ?? 'Untitled',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  DateFormat('MMM-dd-yyyy kk:mm')
                                      .format(e.createdAt),
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
