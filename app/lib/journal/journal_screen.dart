import 'package:cbt_journal/models/journal_entry.dart';
import 'package:flutter/material.dart';
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
        watchPropertyValue((UserJournalEntries m) => m.entries);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: journalEntries
              .map((e) => Card(
                    child: Material(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Text(e.title ?? 'Untitled'),
                              // TODO: add date created
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/view-journal-entry',
                              arguments: e.id);
                        },
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
