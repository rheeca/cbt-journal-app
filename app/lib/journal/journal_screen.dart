import 'package:cbt_journal/common/navigation.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _JournalPage(),
      drawer: const AppDrawer(),
    );
  }
}

class _JournalPage extends WatchingStatefulWidget {
  const _JournalPage();

  @override
  State<_JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<_JournalPage> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    await di<JournalController>().load();
  }

  @override
  Widget build(BuildContext context) {
    final loading = watchPropertyValue((JournalController c) => c.isLoading);
    if (loading) {
      return LoadingAnimationWidget.waveDots(
        color: Colors.blueGrey,
        size: 50,
      );
    }

    final journalEntries =
        watchPropertyValue((JournalController c) => c.journalEntries);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
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
                      onTap: () {
                        context.push('/journal/view/${e.id}');
                      },
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
