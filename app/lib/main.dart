import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/discover/discover_controller.dart';
import 'package:cbt_journal/goals/edit_goal/edit_goal_controller.dart';
import 'package:cbt_journal/goals/goals_controller.dart';
import 'package:cbt_journal/home/home_controller.dart';
import 'package:cbt_journal/journal/edit_journal/edit_journal_controller.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:cbt_journal/route_generator.dart';
import 'package:cbt_journal/services/journal_service.dart';
import 'package:cbt_journal/settings/settings_controller.dart';
import 'package:cbt_journal/theme.dart';
import 'package:cbt_journal/user/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  di
    ..registerLazySingleton<AppDatabase>(() => AppDatabase())
    ..registerLazySingleton<DiscoverController>(
        () => DiscoverController(database: di<AppDatabase>()))
    ..registerLazySingleton<EditGoalController>(
        () => EditGoalController(database: di<AppDatabase>()))
    ..registerLazySingleton<EditJournalController>(
        () => EditJournalController(database: di<AppDatabase>()))
    ..registerLazySingleton<GoalsController>(
        () => GoalsController(database: di<AppDatabase>()))
    ..registerLazySingleton<HomeController>(
        () => HomeController(database: di<AppDatabase>()))
    ..registerLazySingleton<JournalController>(
        () => JournalController(database: di<AppDatabase>()))
    ..registerLazySingleton<SettingsController>(
        () => SettingsController(database: di<AppDatabase>()))
    ..registerLazySingleton<JournalService>(
        () => JournalService(database: di<AppDatabase>()))
    ..registerLazySingleton<UserController>(() => UserController());

  await di<JournalService>().load();
  await initializeAppData();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CBTApp());
}

class CBTApp extends StatelessWidget {
  const CBTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          return MaterialApp.router(
            theme: theme,
            routerConfig: getRouter(user),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}

Future<void> initializeAppData() async {
  await di<JournalService>().downloadDiscover();
}
