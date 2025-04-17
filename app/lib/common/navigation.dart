import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/generated/user.pb.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:cbt_journal/services/journal_service.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_it/watch_it.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              final service = JournalService();
              await service.initialize();

              final logs = await di<AppDatabase>().getSyncLogs();
              final groupedLogs = groupBy(logs, (e) => e.type);

              final userLogs = groupedLogs[DatabaseType.user];
              if (userLogs != null) {
                final userIds = userLogs.map((e) => e.id).toList();
                final users = await di<AppDatabase>().getUsers(userIds);
                final toDelete =
                    userIds.where((e) => !users.map((e) => e.id).contains(e));

                if (users.isNotEmpty) {
                  await service.userClient?.writeUsers(WriteUsersRequest(
                    users: users,
                  ));
                }
                if (toDelete.isNotEmpty) {
                  await service.userClient
                      ?.deleteUsers(DeleteUsersRequest(ids: toDelete));
                }
              }

              await di<AppDatabase>().clearSyncLogs();
              await service.dispose();
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
