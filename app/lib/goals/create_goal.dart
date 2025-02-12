import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/goals/goals_controller.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
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
        child: Column(
          children: [
            TextField(
              controller: titleController,
            ),
            FilledButton(
              onPressed: () async {
                final userId = di<UserController>().currentUser!.userId;
                final goalSettingJournalId =
                    di<JournalController>().selectedJournalEntry!.id;

                final goal = Goal.createNew(
                    userId: userId,
                    title: titleController.text,
                    goalSettingJournal: goalSettingJournalId,
                    journalEntries: []);
                await di<AppDatabase>().insertGoal(goal);
                await di<GoalsController>().load();

                // TODO: Loading indicator until goal is saved
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Create Goal'),
            )
          ],
        ),
      ),
    );
  }
}
