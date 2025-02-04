import 'package:cbt_journal/models/journal_entry.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class ViewJournalEntryScreen extends StatelessWidget {
  const ViewJournalEntryScreen({super.key, required this.journalId});
  final String journalId;

  @override
  Widget build(BuildContext context) {
    final journal = di<UserJournalEntries>().getEntryById(journalId);
    final GuidedJournal guidedJournal =
        di<CurrentGuidedJournals>().getGuidedJournalById(journal.guidedJournal);
    List<int> indexList = [
      for (int i = 0; i < guidedJournal.guideQuestions.length; i++) i
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 64.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: indexList.map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(guidedJournal.guideQuestions[e],
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 8.0),
                  Text(journal.content[e]),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
