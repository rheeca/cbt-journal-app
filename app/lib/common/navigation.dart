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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                context.push('/settings');
              },
            ),
            ListTile(
              title: const Text('Sync Data'),
              leading: const Icon(Icons.sync),
              onTap: () async {
                await di<JournalService>().onSync();
              },
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              onTap: () async {
                await di<JournalService>().onSync();
                await di<JournalService>().logoutDevice();

                await _clearLocalData();
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
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
