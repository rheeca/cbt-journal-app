import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class JournalEntry {
  String id;
  String userId;
  DateTime createdAt;
  String guidedJournal;
  String? title;
  List<String> content;

  JournalEntry({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.guidedJournal,
    this.title,
    required this.content,
  });
  JournalEntry.createNew(
      {required this.userId,
      required this.guidedJournal,
      this.title,
      required this.content})
      : id = const Uuid().v4(),
        createdAt = DateTime.now();
}

class UserJournalEntries extends ChangeNotifier {
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

class GuidedJournal {
  String id;
  String title;
  List<String> guideQuestions;
  String description;
  List<JournalType> journalType;

  GuidedJournal({
    required this.id,
    required this.title,
    required this.guideQuestions,
    required this.description,
    required this.journalType,
  });
  GuidedJournal.createNew(
      {required this.title,
      required this.guideQuestions,
      this.description = '',
      required this.journalType})
      : id = const Uuid().v4();
}

class CurrentGuidedJournals extends ChangeNotifier {
  List<GuidedJournal> guidedJournals = [];

  GuidedJournal getGuidedJournalById(String id) {
    return guidedJournals.firstWhere((e) => e.id == id);
  }

  addMultiple(List<GuidedJournal> items) {
    guidedJournals = [...guidedJournals, ...items];
  }
}

enum JournalType { mood, text }
