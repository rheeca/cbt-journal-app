import 'package:cbt_journal/models/goal.dart';
import 'package:flutter/material.dart';

class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({super.key});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Welcome back!'),
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
                          Navigator.pushNamed(context, '/journal-entry');
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
          Column(
            children: _goals
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
                              onPressed: () {}, child: const Text('Check-in'))
                        ],
                      ),
                    ),
                  )),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}

// TODO: put in database
List<Goal> _goals = [
  Goal(id: '123', title: 'Public Speaking', description: '')
];
