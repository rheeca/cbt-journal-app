import 'package:cbt_journal/common/navigation.dart';
import 'package:cbt_journal/home/home_controller.dart';
import 'package:cbt_journal/services/journal_service.dart';
import 'package:cbt_journal/theme.dart';
import 'package:cbt_journal/user/create_profile.dart';
import 'package:cbt_journal/user/user_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/home_background.png',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: const _HomePage(),
          drawer: const AppDrawer(),
          backgroundColor: Colors.transparent,
        ),
      ],
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
    final registered = watchPropertyValue((UserController c) => c.registered);
    final syncing = watchPropertyValue((JournalService c) => c.syncing);
    if (loading || syncing || registered == null) {
      return Center(
        child: LoadingAnimationWidget.waveDots(
          color: Colors.blueGrey.shade200,
          size: 30,
        ),
      );
    }

    final profileCreated =
        watchPropertyValue((UserController m) => m.registered);
    if (profileCreated == false) {
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Welcome back, $username!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: 70.0),
          Card(
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 20.0,
            ),
            color: AppColor.lightYellow.color.withValues(alpha: 0.9),
            elevation: 8.0,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How are you?',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FilledButton(
                          onPressed: () {
                            context.push('/journal/create/${dailyJournal!.id}');
                          },
                          child: const Text('Check In')),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Today\'s Goals',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 20,
                    ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              child: Card(
                color: AppColor.lightYellow.color.withValues(alpha: 0.9),
                margin: const EdgeInsets.only(top: 12.0, bottom: 16.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: todaysGoals.isNotEmpty
                      ? ListView.separated(
                          itemCount: todaysGoals.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemBuilder: (BuildContext context, int index) {
                            final item = todaysGoals.toList()[index];
                            return Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 28.0, vertical: 4.0),
                              child: Row(
                                children: [
                                  Text(item.type.label),
                                  const Expanded(child: SizedBox()),
                                  Checkbox(
                                    value: goalCheckIns.goals
                                        .contains(item.type.name),
                                    onChanged: (bool? value) {
                                      if (value == true) {
                                        goalCheckIns.goals.add(item.type.name);
                                      } else {
                                        goalCheckIns.goals
                                            .remove(item.type.name);
                                      }
                                      di<HomeController>()
                                          .updateGoalCheckIns(goalCheckIns);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : const SizedBox.expand(
                          child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'No goals for today',
                            textAlign: TextAlign.center,
                          ),
                        )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
