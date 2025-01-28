import 'package:cbt_journal/models/journal_entry.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class ViewJournalEntryScreen extends StatelessWidget {
  const ViewJournalEntryScreen({super.key, required this.journalId});
  final String journalId;

  @override
  Widget build(BuildContext context) {
    final journal = GetIt.I<JournalEntries>().getEntryById(journalId);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 64.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                // TODO: change according to guide question
                'How are you feeling?'),
            const SizedBox(height: 12.0),
            Text(journal.content),
          ],
        ),
      ),
    );
  }
}
