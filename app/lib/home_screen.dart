import 'package:cbt_journal/discover/discover_screen.dart';
import 'package:cbt_journal/goals/goals_screen.dart';
import 'package:cbt_journal/home/home_detail_screen.dart';
import 'package:cbt_journal/journal/journal_screen.dart';
import 'package:cbt_journal/user/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class HomeScreen extends StatefulWidget with WatchItStatefulWidgetMixin {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    await di<UserController>().load();
  }

  @override
  Widget build(BuildContext context) {
    final loading = watchPropertyValue((UserController c) => c.isLoading);
    if (loading) {
      return Scaffold(
        body: Center(
          child: LoadingAnimationWidget.waveDots(
            color: Colors.blueGrey.shade200,
            size: 30,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacementNamed(context, ('/auth/sign-in'));
              },
            )
          ],
        ),
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Goals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'My Journal',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

const List<Widget> _pages = <Widget>[
  HomeDetailScreen(),
  DiscoverScreen(),
  GoalsScreen(),
  JournalScreen()
];
