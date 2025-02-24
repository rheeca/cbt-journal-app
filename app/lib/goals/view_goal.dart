import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/goals/goals_controller.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:flutter/material.dart';
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
                onPressed: () {},
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(selectedGoal.title,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12.0),
            const Text('Journal entry here'),
          ],
        ),
      ),
    );
  }
}
