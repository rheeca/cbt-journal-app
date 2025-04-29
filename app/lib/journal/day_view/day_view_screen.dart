import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:cbt_journal/journal/journal_screen.dart';
import 'package:cbt_journal/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:watch_it/watch_it.dart';

class DayViewScreen extends StatelessWidget with WatchItMixin {
  const DayViewScreen({super.key, required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final selectedDateEntries =
        watchPropertyValue((JournalController c) => c.selectedDateEntries);

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: AppColor.lightYellow.color,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(date),
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView(
                    children: selectedDateEntries
                        .map((e) => JournalEntryCard(
                              entry: e,
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
