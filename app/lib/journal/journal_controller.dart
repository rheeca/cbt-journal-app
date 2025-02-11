import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class JournalController extends ChangeNotifier {
  JournalController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  JournalEntry? _selectedJournalEntry;
  JournalEntry? get selectedJournalEntry => _selectedJournalEntry;
  set selectedJournalEntry(JournalEntry? value) {
    _selectedJournalEntry = value;
    notifyListeners();
  }

  final List<JournalEntry> _journalEntries = [];
  List<JournalEntry> get journalEntries => _journalEntries;

  final List<GuidedJournal> _guidedJournals = [];
  List<GuidedJournal> get guidedJournals => _guidedJournals;

  void load() async {
    _isLoading = true;
    notifyListeners();

    await loadJournalEntries();
    await loadGuidedJournals();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadJournalEntries() async {
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

  Future<void> loadGuidedJournals() async {
    final AppDatabase db = di<AppDatabase>();
    List<GuidedJournalEntity> items = await db.getAllGuidedJournals();

    _guidedJournals.clear();
    _guidedJournals.addAll(items
        .map((e) => GuidedJournal(
            id: e.id,
            title: e.title,
            guideQuestions: e.guideQuestions,
            description: e.description,
            journalType: e.journalType
                .map((e) => JournalType.values.byName(e))
                .toList()))
        .toList());

    notifyListeners();
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
