import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class EditJournalController extends ChangeNotifier {
  EditJournalController({required AppDatabase database}) : _database = database;

  final AppDatabase _database;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  JournalEntry? _selectedJournalEntry;
  JournalEntry? get selectedJournalEntry => _selectedJournalEntry;

  GuidedJournal? _selectedGuidedJournal;
  GuidedJournal? get selectedGuidedJournal => _selectedGuidedJournal;

  Future<void> load(String? guidedJournalId, String? journalId) async {
    _isLoading = true;
    notifyListeners();

    if (journalId != null) {
      _selectedJournalEntry =
          (await _database.getJournalEntries(ids: [journalId])).firstOrNull;
      if (_selectedJournalEntry != null) {
        _selectedGuidedJournal = await _database
            .getGuidedJournal(_selectedJournalEntry!.guidedJournal);
      }
    } else if (guidedJournalId != null) {
      _selectedGuidedJournal =
          await _database.getGuidedJournal(guidedJournalId);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> insertJournalEntry(JournalEntry entry) async {
    await _database.insertJournalEntries([entry]);
  }
}

enum Sentiment {
  verySad(value: '1', icon: Icon(Icons.sentiment_very_dissatisfied)),
  sad(value: '2', icon: Icon(Icons.sentiment_dissatisfied)),
  neutral(value: '3', icon: Icon(Icons.sentiment_neutral)),
  happy(value: '4', icon: Icon(Icons.sentiment_satisfied_alt)),
  veryHappy(value: '5', icon: Icon(Icons.sentiment_very_satisfied));

  const Sentiment({required this.icon, required this.value});
  final Icon icon;
  final String value;

  static Sentiment? getSentimentByValue(String value) {
    return Sentiment.values.firstWhere((e) => e.value == value);
  }
}
