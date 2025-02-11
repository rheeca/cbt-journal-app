import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:cbt_journal/route_generator.dart';
import 'package:cbt_journal/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:watch_it/watch_it.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  di.registerSingleton<AppDatabase>(AppDatabase());
  di.registerSingleton<CurrentUser>(CurrentUser());
  di.registerSingleton<JournalController>(JournalController());

  // TODO: user login
  final db = di<AppDatabase>();
  final user = await db.getUser(dotenv.env['USER_ID'] ?? '');
  if (user != null) {
    di<CurrentUser>().setUser(UserModel(
        userId: user.id, email: user.email, displayName: user.displayName));
  }

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
