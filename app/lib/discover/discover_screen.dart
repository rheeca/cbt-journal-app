import 'package:cbt_journal/common/navigation.dart';
import 'package:cbt_journal/discover/discover_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _DiscoverPage(),
      drawer: const AppDrawer(),
    );
  }
}

class _DiscoverPage extends StatefulWidget with WatchItStatefulWidgetMixin {
  const _DiscoverPage();

  @override
  State<_DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<_DiscoverPage> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    await di<DiscoverController>().load();
  }

  @override
  Widget build(BuildContext context) {
    final loading = watchPropertyValue((DiscoverController c) => c.loading);
    if (loading) {
      return LoadingAnimationWidget.waveDots(
        color: Colors.blueGrey,
        size: 50,
      );
    }

    final guidedJournals =
        watchPropertyValue((DiscoverController c) => c.guidedJournals);
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
                            context.push('/journal/create/${e.id}');
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
