import 'package:uuid/uuid.dart';

class Goal {
  String id;
  String userId;
  DateTime createdAt;
  String title;
  String goalSettingJournal;
  List<String> journalEntries;

  Goal({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.title,
    required this.goalSettingJournal,
    required this.journalEntries,
  });

  Goal.createNew(
      {required this.userId,
      this.title = 'Untitled',
      required this.goalSettingJournal,
      required this.journalEntries})
      : id = const Uuid().v4(),
        createdAt = DateTime.now();
}
