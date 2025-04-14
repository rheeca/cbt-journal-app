import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:table_calendar/table_calendar.dart';

var logger = Logger();

class JournalController extends ChangeNotifier {
  JournalController({required AppDatabase database}) : _database = database;

  final AppDatabase _database;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<JournalEntry> _journalEntries = [];
  List<JournalEntry> get journalEntries => _journalEntries;

  final Map<String, JournalEntry> _moodEntriesByDate = {};
  Map<String, JournalEntry> get moodEntriesByDate => _moodEntriesByDate;

  final Map<String, List<JournalEntry>> _journalEntriesByDate = {};
  Map<String, List<JournalEntry>> get journalEntriesByDate =>
      _journalEntriesByDate;

  final List<JournalEntry> _selectedDateEntries = [];
  List<JournalEntry> get selectedDateEntries => _selectedDateEntries;

  final List<GuidedJournal> _guidedJournals = [];
  List<GuidedJournal> get guidedJournals => _guidedJournals;

  final List<Goal> _goals = [];
  List<Goal> get goals => _goals;

  final List<GoalCheckIn> _goalCheckIns = [];
  List<GoalCheckIn> get goalCheckIns => _goalCheckIns;

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      _isLoading = false;
      notifyListeners();
      return;
    }

    _currentUser = await _database.getUser(userId);

    final journalEntries = await _database.getJournalEntriesByUser(userId);
    _journalEntries.clear();
    _journalEntries.addAll(journalEntries);

    _moodEntriesByDate.clear();
    _journalEntriesByDate.clear();
    for (final e in _journalEntries) {
      final date = DateFormat('yyyy-MM-d').format(e.createdAt);
      // TODO: make guided journals types an enum.
      // Checking for Daily Check-in journal.
      if (e.guidedJournal == '5f3d321c-e835-470d-89c2-b2478a297481') {
        if ((_moodEntriesByDate[date]?.createdAt)?.isBefore(e.createdAt) ??
            true) {
          _moodEntriesByDate[date] = e;
        }
      } else {
        if (_journalEntriesByDate[date] == null) {
          _journalEntriesByDate[date] = [e];
        } else {
          _journalEntriesByDate[date]!.add(e);
        }
      }
    }

    final guidedJournals = await _database.getAllGuidedJournals();
    _guidedJournals.clear();
    _guidedJournals.addAll(guidedJournals);

    final goals = await _database.getGoalsByUser(userId);
    _goals.clear();
    _goals.addAll(goals);

    final checkIns = await _database.getGoalCheckInsByUser(userId);
    _goalCheckIns.clear();
    _goalCheckIns.addAll(checkIns);

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

  void selectDate(DateTime date) {
    _selectedDateEntries.clear();
    _selectedDateEntries
        .addAll(_journalEntries.where((e) => isSameDay(e.createdAt, date)));
  }
}
