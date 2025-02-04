import 'package:cbt_journal/models/journal_entry.dart';
import 'package:cbt_journal/models/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:watch_it/watch_it.dart';

class EditJournalEntryScreen extends WatchingStatefulWidget {
  const EditJournalEntryScreen({super.key});

  @override
  State<EditJournalEntryScreen> createState() => _EditJournalEntryScreenState();
}

class _EditJournalEntryScreenState extends State<EditJournalEntryScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = watchPropertyValue((CurrentUser m) => m.userId);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 64.0),
        child: Column(
          children: [
            const Text('How are you feeling?'),
            const SizedBox(height: 12.0),
            Expanded(
                child: TextField(
              controller: contentController,
              maxLines: null,
              decoration: null,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final DateTime now = DateTime.now();
          final title = DateFormat('yyyy-MM-dd h:mm a').format(now);
          di<UserJournalEntries>().addEntry(JournalEntry.createNew(
            userId: userId,
            title: title,
            content: contentController.text,
          ));
          Navigator.pop(context);
        },
        elevation: 1.0,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
