import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/generated/goal.pbgrpc.dart' as pb_goal;
import 'package:cbt_journal/generated/goal_checkin.pbgrpc.dart' as pb_gc;
import 'package:cbt_journal/generated/journal_entry.pbgrpc.dart' as pb_journal;
import 'package:cbt_journal/generated/user.pb.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:cbt_journal/services/journal_service.dart';
import 'package:cbt_journal/util/util.dart';
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
            onTap: _syncData,
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

  Future<void> _syncData() async {
    final service = JournalService();
    await service.initialize();

    final logs = await di<AppDatabase>().getSyncLogs();
    final groupedLogs = groupBy(logs, (e) => e.type);

    final checkInLogs = groupedLogs[DatabaseType.goalCheckIn];
    if (checkInLogs != null) {
      final splitStr = checkInLogs[0].id.split('+');
      final userId = splitStr[0];

      final dates =
          checkInLogs.map((e) => DateTime.parse(e.id.split('+')[1])).toList();
      final checkIns = await di<AppDatabase>().getGoalCheckIns(userId, dates);

      if (checkIns.isNotEmpty) {
        await service.goalCheckInClient
            ?.writeGoalCheckIns(pb_gc.WriteGoalCheckInsRequest(
          goalCheckIns: checkIns.map((e) => pb_gc.GoalCheckIn(
                userId: e.userId,
                date: e.date.toProtoTimestamp(),
                goals: e.goals,
              )),
        ));
      }
    }

    final goalLogs = groupedLogs[DatabaseType.goal];
    if (goalLogs != null) {
      final ids = goalLogs.map((e) => e.id).toList();
      final goals = await di<AppDatabase>().getGoals(ids);
      final toDelete = ids.where((e) => !goals.map((e) => e.id).contains(e));

      if (goals.isNotEmpty) {
        await service.goalClient?.writeGoals(pb_goal.WriteGoalsRequest(
          goals: goals.map((e) => pb_goal.Goal(
                id: e.id,
                userId: e.userId,
                createdAt: e.createdAt.toProtoTimestamp(),
                title: e.title,
                type: e.type.name,
                guideQuestions:
                    e.guideQuestions.map((e) => pb_goal.GuideQuestion(
                          question: e.question,
                          answer: e.answer,
                          type: e.type.name,
                          answerType: e.answerType.name,
                          answerCanvasElements: e.answerCanvasElements,
                          answerCanvasImage: e.answerCanvasImage,
                        )),
                notificationSchedule:
                    e.notificationSchedule.map((e) => e.name).toList(),
                isArchived: e.isArchived,
              )),
        ));
      }
      if (toDelete.isNotEmpty) {
        await service.goalClient
            ?.deleteGoals(pb_goal.DeleteGoalsRequest(ids: toDelete));
      }
    }

    final journalLogs = groupedLogs[DatabaseType.journalEntry];
    if (journalLogs != null) {
      final ids = journalLogs.map((e) => e.id).toList();
      final entries = await di<AppDatabase>().getJournalEntries(ids);
      final toDelete = ids.where((e) => !entries.map((e) => e.id).contains(e));

      if (entries.isNotEmpty) {
        await service.journalEntryClient
            ?.writeJournalEntries(pb_journal.WriteJournalEntriesRequest(
          journalEntries: entries.map((e) => pb_journal.JournalEntry(
                id: e.id,
                userId: e.userId,
                createdAt: e.createdAt.toProtoTimestamp(),
                guidedJournal: e.guidedJournal,
                title: e.title,
                content: e.content.map((e) => pb_goal.GuideQuestion(
                      question: e.question,
                      answer: e.answer,
                      type: e.type.name,
                      answerType: e.answerType.name,
                      answerCanvasElements: e.answerCanvasElements,
                      answerCanvasImage: e.answerCanvasImage,
                    )),
              )),
        ));
      }
      if (toDelete.isNotEmpty) {
        await service.journalEntryClient?.deleteJournalEntries(
            pb_journal.DeleteJournalEntriesRequest(ids: toDelete));
      }
    }

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
  }
}
