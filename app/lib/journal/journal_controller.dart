import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/generated/user.pb.dart' as pb_user;
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

  pb_user.User? _currentUser;
  pb_user.User? get currentUser => _currentUser;

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      _isLoading = false;
      notifyListeners();
      return;
    }

    _currentUser = (await _database.getUsers([userId])).firstOrNull;

    final journalEntries = await _database.getJournalEntries(userId: userId);
    _journalEntries.clear();
    _journalEntries.addAll(journalEntries);

    _moodEntriesByDate.clear();
    _journalEntriesByDate.clear();
    for (final e in _journalEntries) {
      final date = DateFormat('yyyy-MM-d').format(e.createdAt.toLocal());
      // TODO: make guided journals types an enum.
      if (e.guidedJournal == 'dailyCheckIn') {
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

    final goals = await _database.getGoals(userId: userId);
    _goals.clear();
    _goals.addAll(goals);

    final checkIns = await _database.getGoalCheckIns(userId: userId);
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
    // DateTime date: only has year, month and day. It represents a day on the calendar,
    //  so compare it with createdAt.toLocal() so entries will display according to the
    //  user's timezone.
    _selectedDateEntries.clear();
    _selectedDateEntries.addAll(
        _journalEntries.where((e) => isSameDay(e.createdAt.toLocal(), date)));
  }
}
