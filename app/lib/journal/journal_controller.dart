import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class JournalController extends ChangeNotifier {
  JournalController({required AppDatabase database}) : _database = database;

  final AppDatabase _database;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<JournalEntry> _journalEntries = [];
  List<JournalEntry> get journalEntries => _journalEntries;

  final List<GuidedJournal> _guidedJournals = [];
  List<GuidedJournal> get guidedJournals => _guidedJournals;

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      _isLoading = false;
      notifyListeners();
      return;
    }

    final journalEntries = await _database.getJournalEntriesByUser(userId);
    _journalEntries.clear();
    _journalEntries.addAll(journalEntries);

    final guidedJournals = await _database.getAllGuidedJournals();
    _guidedJournals.clear();
    _guidedJournals.addAll(guidedJournals);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteJournalEntry(String id) async {
    _isLoading = true;
    notifyListeners();

    await _database.deleteJournalEntry(id);
    _journalEntries.removeWhere((e) => e.id == id);

    _isLoading = false;
    notifyListeners();
  }
}
