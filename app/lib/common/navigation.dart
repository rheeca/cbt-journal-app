import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/services/journal_service.dart';
import 'package:cbt_journal/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_it/watch_it.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.white.color,
      child: ListView(
        children: [
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              context.go('/settings');
            },
          ),
          ListTile(
            title: const Text('Sync Data'),
            onTap: () async {
              await di<JournalService>().onSync();
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () async {
              await di<JournalService>().onSync();

              await _clearLocalData();
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _clearLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('lastSynced');
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      await di<AppDatabase>().removeUser(userId);
    }
  }
}
