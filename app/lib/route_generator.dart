import 'package:cbt_journal/user/sign_in_screen.dart';
import 'package:cbt_journal/goals/create_goal.dart';
import 'package:cbt_journal/goals/edit_goal_screen.dart';
import 'package:cbt_journal/goals/view_goal.dart';
import 'package:cbt_journal/home_screen.dart';
import 'package:cbt_journal/journal/confirm_create_journal_screen.dart';
import 'package:cbt_journal/journal/edit_journal_entry_screen.dart';
import 'package:cbt_journal/journal/view_journal_entry_screen.dart';
import 'package:cbt_journal/models/model.dart' show GuidedJournal;
import 'package:cbt_journal/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/auth/sign-in':
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      case '/goal/create':
        return MaterialPageRoute(
          builder: (_) => const CreateGoalScreen(),
        );
      case '/goal/edit':
        return MaterialPageRoute(
          builder: (_) => const EditGoalScreen(),
        );
      case '/goal/view':
        return MaterialPageRoute(
          builder: (_) => const ViewGoalScreen(),
        );
      case '/journal-entry/create':
        if (args is GuidedJournal) {
          return MaterialPageRoute(
            builder: (_) => EditJournalEntryScreen(
                mode: EditJournalMode.create, guidedJournal: args),
          );
        }
        return _errorRoute();
      case '/journal-entry/create/confirm':
        return MaterialPageRoute(
          builder: (_) => const ConfirmCreateJournalScreen(),
        );
      case '/journal-entry/edit':
        if (args is GuidedJournal) {
          return MaterialPageRoute(
            builder: (_) => EditJournalEntryScreen(
                mode: EditJournalMode.edit, guidedJournal: args),
          );
        }
        return _errorRoute();
      case '/view-journal-entry':
        return MaterialPageRoute(
            builder: (_) => const ViewJournalEntryScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
