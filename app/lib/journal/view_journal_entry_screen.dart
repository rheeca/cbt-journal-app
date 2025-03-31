import 'package:cbt_journal/journal/edit_journal/edit_journal_controller.dart';
import 'package:cbt_journal/journal/edit_journal/edit_journal_entry_screen.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:cbt_journal/models/journal_entry.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class ViewJournalEntryScreen extends StatefulWidget
    with WatchItStatefulWidgetMixin {
  const ViewJournalEntryScreen({super.key, required this.journalId});

  final String journalId;

  @override
  State<ViewJournalEntryScreen> createState() => _ViewJournalEntryScreenState();
}

class _ViewJournalEntryScreenState extends State<ViewJournalEntryScreen> {
  bool _isPopping = false;

  @override
  Widget build(BuildContext context) {
    if (_isPopping) return const SizedBox();

    final loading = watchPropertyValue((JournalController c) => c.isLoading);
    if (loading) {
      return LoadingAnimationWidget.waveDots(
        color: Colors.blueGrey,
        size: 50,
      );
    }

    final List<JournalEntry> journalEntries =
        watchPropertyValue((JournalController c) => c.journalEntries);
    final journal =
        journalEntries.firstWhereOrNull((e) => e.id == widget.journalId);
    if (journal == null) {
      return const Text('Empty');
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
                  final updated =
                      await context.push<bool>('/journal/edit/${journal.id}');
                  if (updated == true) {
                    di<JournalController>().load();
                  }
                },
              ),
              MenuItemButton(
                child: const Text('Delete'),
                onPressed: () {
                  // TODO: Prevent rebuilding while popping to avoid black screen.
                  // Or other solutions.
                  _isPopping = true;
                  di<JournalController>().deleteJournalEntry(journal.id);
                  context.pop();
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
                  Text(journal.content[e].question,
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 8.0),
                  _ContentText(
                    journalType: guidedJournal.journalType[e],
                    content: journal.content[e].answer,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ContentText extends StatelessWidget {
  const _ContentText({required this.journalType, required this.content});
  final JournalType journalType;
  final String content;

  @override
  Widget build(BuildContext context) {
    if (journalType == JournalType.mood) {
      return Sentiment.getSentimentByValue(content)?.icon ??
          Sentiment.neutral.icon;
    } else if (journalType == JournalType.distortion) {
      final distortions = content.split(',');
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: distortions
            .map(
              (e) => Text(CognitiveDistortion.getByName(e)?.label ?? ''),
            )
            .toList(),
      );
    } else {
      return Text(content);
    }
  }
}
