import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:cbt_journal/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  di.registerSingleton<AppDatabase>(AppDatabase());
  di.registerSingleton<CurrentUser>(CurrentUser());
  di.registerSingleton<UserJournalEntries>(UserJournalEntries());

  // TODO: user login
  final user =
      await di<AppDatabase>().getUser("e2195ad0-d07d-48fd-a7d7-7ee330a7edc1");
  if (user != null) {
    di<CurrentUser>().setUser(UserModel(
        userId: user.id, email: user.email, displayName: user.displayName));
  }

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
