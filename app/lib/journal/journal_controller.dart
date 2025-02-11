import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class JournalController extends ChangeNotifier {
  JournalController();

  JournalEntry? _selectedJournalEntry;
  JournalEntry? get selectedJournalEntry => _selectedJournalEntry;
  set selectedJournalEntry(JournalEntry? value) {
    _selectedJournalEntry = value;
    notifyListeners();
  }

  final List<JournalEntry> _journalEntries = [];
  List<JournalEntry> get journalEntries => _journalEntries;

  void updateJournalEntries() async {
    final AppDatabase db = di<AppDatabase>();
    final userId = di<CurrentUser>().userId;
    final journalEntries = await db.getJournalEntriesByUser(userId);

    _journalEntries.clear();
    _journalEntries.addAll(journalEntries.map((e) => JournalEntry(
          id: e.id,
          userId: e.userId,
          createdAt: e.createdAt,
          guidedJournal: e.guidedJournal,
          title: e.title,
          content: e.content ?? [],
        )));

    notifyListeners();
  }
}
