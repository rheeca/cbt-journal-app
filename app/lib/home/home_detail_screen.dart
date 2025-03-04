import 'package:cbt_journal/goals/goals_controller.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:cbt_journal/user/user_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class HomeDetailScreen extends WatchingStatefulWidget {
  const HomeDetailScreen({super.key});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    await di<GoalsController>().load();
    await di<JournalController>().load();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = watchPropertyValue((JournalController c) => c.isLoading);
    if (isLoading) {
      return Center(
        child: LoadingAnimationWidget.waveDots(
          color: Colors.blueGrey.shade200,
          size: 30,
        ),
      );
    }

    final username =
        watchPropertyValue((UserController m) => m.currentUser?.displayName) ??
            '';
    final guidedJournals =
        watchPropertyValue((JournalController c) => c.guidedJournals);
    final dailyJournal =
        guidedJournals.firstWhereOrNull((e) => e.title == 'Daily Check-in');

    final isLoadingGoals =
        watchPropertyValue((GoalsController c) => c.isLoading);

    final goals = watchPropertyValue((GoalsController c) => c.goals);

    final now = DateTime.now();
    final todaysGoals = goals.where((e) {
      for (final i in e.notificationSchedule) {
        if ((i.index + 1) == now.weekday) {
          return true;
        }
      }
      return false;
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Welcome back, $username!'),
            ],
          ),
          const SizedBox(height: 12.0),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    FilledButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/journal-entry/create',
                              arguments: dailyJournal);
                        },
                        child: const Text('Start')),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Today\'s Goals'),
            ],
          ),
          isLoadingGoals
              ? LoadingAnimationWidget.waveDots(
                  color: Colors.blueGrey,
                  size: 50,
                )
              : Expanded(
                  child: ListView(
                    children: todaysGoals
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
                                      onPressed: () async {
                                        di<JournalController>().selectedGoal =
                                            e;
                                        await Navigator.pushNamed(
                                          context,
                                          '/journal-entry/create',
                                          arguments: dailyJournal,
                                        );

                                        di<JournalController>().selectedGoal =
                                            null;
                                      },
                                      child: const Text('Check-in'))
                                ],
                              ),
                            ),
                          )),
                        )
                        .toList(),
                  ),
                )
        ],
      ),
    );
  }
}
