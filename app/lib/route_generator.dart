import 'package:cbt_journal/home_screen.dart';
import 'package:cbt_journal/home/edit_journal_entry_screen.dart';
import 'package:cbt_journal/home/view_journal_entry_screen.dart';
import 'package:cbt_journal/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      case '/journal-entry':
        return MaterialPageRoute(
          builder: (_) => const EditJournalEntryScreen(),
        );
      case '/view-journal-entry':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => ViewJournalEntryScreen(journalId: args),
          );
        }
        return _errorRoute();
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
