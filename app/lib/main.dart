import 'package:cbt_journal/models/journal_entry.dart';
import 'package:cbt_journal/models/user.dart';
import 'package:cbt_journal/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

void main() {
  di.registerSingleton<CurrentUserModel>(CurrentUserModel());
  di.registerSingleton<JournalEntries>(JournalEntries());
  runApp(const CBTApp());
}

class CBTApp extends StatelessWidget {
  const CBTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
