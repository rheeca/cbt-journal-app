import 'package:cbt_journal/common/navigation.dart';
import 'package:cbt_journal/discover/discover_controller.dart';
import 'package:cbt_journal/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

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
          body: const _DiscoverPage(),
          drawer: const AppDrawer(),
          backgroundColor: Colors.transparent,
        ),
      ],
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

    final screenWidth = (MediaQuery.of(context).size.width / 2) - 30;

    final guidedJournals =
        watchPropertyValue((DiscoverController c) => c.guidedJournals);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Guided Journals',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Wrap(
            children: guidedJournals
                .map(
                  (e) => Card(
                      child: InkWell(
                    onTap: () {
                      context.push('/journal/create/${e.id}');
                    },
                    child: SizedBox(
                      height: screenWidth * 0.9,
                      width: screenWidth,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image.asset(
                              'assets/${e.id}.png',
                              height: 112.0,
                              errorBuilder: (context, error, stackTrace) =>
                                  const SizedBox(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Text(
                              e.title.toUpperCase(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
