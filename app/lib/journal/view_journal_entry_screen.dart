import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:cbt_journal/models/journal_entry.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class ViewJournalEntryScreen extends StatefulWidget
    with WatchItStatefulWidgetMixin {
  const ViewJournalEntryScreen({super.key});

  @override
  State<ViewJournalEntryScreen> createState() => _ViewJournalEntryScreenState();
}

class _ViewJournalEntryScreenState extends State<ViewJournalEntryScreen> {
  @override
  Widget build(BuildContext context) {
    final JournalEntry? journal =
        watchPropertyValue((JournalController c) => c.selectedJournalEntry);
    if (journal == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Text('Empty'),
      );
    }

    final guidedJournals =
        watchPropertyValue((JournalController c) => c.guidedJournals);
    final GuidedJournal guidedJournal =
        guidedJournals.firstWhere((e) => e.id == journal.guidedJournal);
    List<int> indexList = [
      for (int i = 0; i < guidedJournal.guideQuestions.length; i++) i
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          MenuAnchor(
            menuChildren: [
              MenuItemButton(
                child: const Text('Edit'),
                onPressed: () async {
                  await Navigator.pushNamed(context, '/journal-entry/edit',
                      arguments: guidedJournal);
                  setState(() {});
                },
              ),
              MenuItemButton(
                child: const Text('Delete'),
                onPressed: () {
                  di<AppDatabase>().deleteJournalEntry(journal.id);
                  di<JournalController>().loadJournalEntries();
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
          children: indexList.map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(guidedJournal.guideQuestions[e],
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 8.0),
                  (guidedJournal.journalType[e] == JournalType.mood)
                      ? Sentiment.getSentimentByValue(journal.content[e])
                              ?.icon ??
                          Sentiment.neutral.icon
                      : Text(journal.content[e]),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
