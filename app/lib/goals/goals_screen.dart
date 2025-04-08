import 'package:cbt_journal/common/navigation.dart';
import 'package:cbt_journal/goals/goals_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _GoalsPage(),
      drawer: const AppDrawer(),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FilledButton.icon(
              onPressed: () async {
                await context.push('/goal/create');
                _load();
                setState(() {});
              },
              icon: const Icon(Icons.add),
              label: const Text('Create a Goal')),
          const SizedBox(height: 24.0),
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: goals
            .map(
              (e) => Card(
                child: InkWell(
                  onTap: () async {
                    await context.push('/goal/view/${e.id}');
                    di<GoalsController>().load();
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                    child: Text(
                      e.type.label,
                      style: Theme.of(context).textTheme.titleMedium,
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
