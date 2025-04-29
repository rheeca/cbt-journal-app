import 'package:cbt_journal/common/navigation.dart';
import 'package:cbt_journal/goals/goals_controller.dart';
import 'package:cbt_journal/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          body: const _GoalsPage(),
          drawer: const AppDrawer(),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}

class _GoalsPage extends StatefulWidget with WatchItStatefulWidgetMixin {
  const _GoalsPage();

  @override
  State<_GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<_GoalsPage> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    await di<GoalsController>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Goals',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton.filled(
                onPressed: () async {
                  await context.push('/goal/create');
                  _load();
                  setState(() {});
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          const Expanded(child: _GoalsListView()),
        ],
      ),
    );
  }
}

class _GoalsListView extends StatelessWidget with WatchItMixin {
  const _GoalsListView();

  @override
  Widget build(BuildContext context) {
    final loading = watchPropertyValue((GoalsController c) => c.isLoading);
    if (loading) {
      return LoadingAnimationWidget.waveDots(
        color: Colors.blueGrey,
        size: 50,
      );
    }

    final goals = watchPropertyValue((GoalsController c) => c.goals);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView(
        children: goals
            .map(
              (e) => Card(
                color: AppColor.white.color,
                child: InkWell(
                  onTap: () async {
                    await context.push('/goal/view/${e.id}');
                    di<GoalsController>().load();
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                    child: Row(
                      children: [
                        Icon(e.type.icon),
                        const SizedBox(width: 8),
                        Text(
                          e.type.label,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
