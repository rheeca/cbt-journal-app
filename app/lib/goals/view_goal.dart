import 'package:cbt_journal/goals/goals_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class ViewGoalScreen extends StatefulWidget with WatchItStatefulWidgetMixin {
  const ViewGoalScreen({super.key, required this.goalId});

  final String goalId;

  @override
  State<ViewGoalScreen> createState() => _ViewGoalScreenState();
}

class _ViewGoalScreenState extends State<ViewGoalScreen> {
  @override
  Widget build(BuildContext context) {
    final loading = watchPropertyValue((GoalsController c) => c.isLoading);
    if (loading) {
      return LoadingAnimationWidget.waveDots(
        color: Colors.blueGrey,
        size: 50,
      );
    }

    final goals = watchPropertyValue((GoalsController c) => c.goals);
    final selectedGoal = goals.firstWhereOrNull((e) => e.id == widget.goalId);

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
                onPressed: () async {
                  final updated =
                      await context.push<bool>('/goal/edit/${selectedGoal.id}');
                  if (updated == true) {
                    di<GoalsController>().load();
                  }
                },
              ),
              MenuItemButton(
                child: const Text('Delete'),
                onPressed: () {
                  di<GoalsController>().deleteGoal(selectedGoal.id);
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/goals');
                  }
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
            const SizedBox(
              height: 600,
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
          : ListView(
              children: entries
                  .map(
                    (e) => Card(
                      child: InkWell(
                        onTap: () async {
                          context.push('/journal/view/${e.id}');
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
