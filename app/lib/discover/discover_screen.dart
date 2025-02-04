import 'package:cbt_journal/models/journal_entry.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class DiscoverScreen extends StatefulWidget with WatchItStatefulWidgetMixin {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    final guidedJournals =
        watchPropertyValue((CurrentGuidedJournals m) => m.guidedJournals);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: guidedJournals
            .map(
              (e) => Card(
                  child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12.0),
                  child: Row(
                    children: [
                      Text(e.title),
                      const Expanded(child: SizedBox()),
                      FilledButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/journal-entry',
                                arguments: e);
                          },
                          child: const Text('Start'))
                    ],
                  ),
                ),
              )),
            )
            .toList(),
      ),
    );
  }
}
