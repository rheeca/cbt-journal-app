import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:watch_it/watch_it.dart';

class JournalScreen extends WatchingStatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  Widget build(BuildContext context) {
    final journalEntries =
        watchPropertyValue((JournalController c) => c.journalEntries);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: journalEntries
              .map((e) => Card(
                    child: InkWell(
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.title ?? 'Untitled',
                                style: Theme.of(context).textTheme.titleMedium,
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
                      onTap: () async {
                        di<JournalController>().selectedJournalEntry = e;
                        await Navigator.pushNamed(
                            context, '/view-journal-entry');

                        di<JournalController>().selectedJournalEntry = null;
                        setState(() {});
                      },
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
