import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:flutter/material.dart';

class DiscoverController extends ChangeNotifier {
  DiscoverController({required AppDatabase database}) : _database = database;

  final AppDatabase _database;

  bool _loading = false;
  bool get loading => _loading;

  final List<GuidedJournal> _guidedJournals = [];
  List<GuidedJournal> get guidedJournals => List.unmodifiable(_guidedJournals);

  Future<void> load() async {
    _loading = true;
    notifyListeners();

    final guidedJournals = await _database.getAllGuidedJournals();
    _guidedJournals.clear();
    _guidedJournals.addAll(guidedJournals);

    _loading = false;
    notifyListeners();
  }
}
