import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/goals/goals_controller.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:cbt_journal/route_generator.dart';
import 'package:cbt_journal/theme.dart';
import 'package:cbt_journal/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  di.registerSingleton<AppDatabase>(AppDatabase());
  di.registerSingleton<JournalController>(JournalController());
  di.registerSingleton<GoalsController>(GoalsController());
  di.registerSingleton<UserController>(UserController());

  await di<UserController>().load();
  di<JournalController>().load();

  runApp(const CBTApp());
}

class CBTApp extends StatelessWidget {
  const CBTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
