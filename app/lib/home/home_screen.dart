import 'package:cbt_journal/common/navigation.dart';
import 'package:cbt_journal/home/home_controller.dart';
import 'package:cbt_journal/user/create_profile.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _HomePage(),
      drawer: const AppDrawer(),
    );
  }
}

class _HomePage extends WatchingStatefulWidget {
  const _HomePage();

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    await di<HomeController>().load();
  }

  @override
  Widget build(BuildContext context) {
    final loading = watchPropertyValue((HomeController c) => c.loading);
    if (loading) {
      return Center(
        child: LoadingAnimationWidget.waveDots(
          color: Colors.blueGrey.shade200,
          size: 30,
        ),
      );
    }

    final profileCreated =
        watchPropertyValue((HomeController m) => m.profileCreated);
    if (!profileCreated) {
      return const CreateProfileScreen();
    }

    final username =
        watchPropertyValue((HomeController m) => m.currentUser?.displayName) ??
            '';
    final guidedJournals =
        watchPropertyValue((HomeController c) => c.guidedJournals);
    final dailyJournal =
        guidedJournals.firstWhereOrNull((e) => e.title == 'Daily Check-in');

    final goals = watchPropertyValue((HomeController c) => c.goals);
    final now = DateTime.now();
    final todaysGoals = goals.where((e) {
      for (final i in e.notificationSchedule) {
        if ((i.index + 1) == now.weekday) {
          return true;
        }
      }
      return false;
    });

    final goalCheckIns =
        watchPropertyValue((HomeController c) => c.goalCheckIns)!;

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
                          context.push('/journal/create/${dailyJournal!.id}');
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
          todaysGoals.isNotEmpty
              ? Expanded(
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
                                  Text(e.type.label),
                                  const Expanded(child: SizedBox()),
                                  Checkbox(
                                    value: goalCheckIns.goals
                                        .contains(e.type.name),
                                    onChanged: (bool? value) {
                                      if (value == true) {
                                        goalCheckIns.goals.add(e.type.name);
                                      } else {
                                        goalCheckIns.goals.remove(e.type.name);
                                      }
                                      di<HomeController>()
                                          .updateGoalCheckIns(goalCheckIns);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )),
                        )
                        .toList(),
                  ),
                )
              : const Text('No goals for today')
        ],
      ),
    );
  }
}
