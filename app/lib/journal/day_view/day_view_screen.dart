import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:watch_it/watch_it.dart';

class DayViewScreen extends StatelessWidget with WatchItMixin {
  const DayViewScreen({super.key, required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final selectedDateEntries =
        watchPropertyValue((JournalController c) => c.selectedDateEntries);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(date),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: selectedDateEntries
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
                                      e.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Text(
                                      DateFormat('MMM-dd-yyyy kk:mm')
                                          .format(e.createdAt.toLocal()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                            onTap: () {
                              context.push('/journal/view/${e.id}');
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
