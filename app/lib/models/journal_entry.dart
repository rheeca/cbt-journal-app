import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class JournalEntry {
  String id;
  String userId;
  String title;
  String content;

  JournalEntry(
      {required this.id,
      required this.userId,
      required this.title,
      required this.content});
  JournalEntry.createNew(
      {required this.userId, this.title = 'Untitled', this.content = ''})
      : id = const Uuid().v4();
}

class JournalEntries extends ChangeNotifier {
  List<JournalEntry> _entries = [];

  List<JournalEntry> get entries => _entries;

  set entries(List<JournalEntry> value) {
    _entries = value;
    notifyListeners();
  }

  addEntry(JournalEntry value) {
    _entries.insert(0, value);
    notifyListeners();
  }

  JournalEntry getEntryById(String id) {
    return _entries.firstWhere((entry) => entry.id == id);
  }
}
