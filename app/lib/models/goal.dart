import 'package:cbt_journal/goals/edit_goal/edit_goal.dart';
import 'package:cbt_journal/models/common.dart';
import 'package:uuid/uuid.dart';

class Goal {
  String id;
  String userId;
  DateTime createdAt;
  String title;
  GoalActivity type;
  List<GuideQuestion> guideQuestions;
  List<DayOfWeek> notificationSchedule;
  List<String> journalEntries;
  bool isArchived;

  Goal({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.title,
    required this.type,
    required this.guideQuestions,
    required this.notificationSchedule,
    required this.journalEntries,
    required this.isArchived,
  });

  Goal.createNew({
    required this.userId,
    this.title = 'Untitled',
    required this.type,
    required this.guideQuestions,
    required this.notificationSchedule,
    required this.journalEntries,
    this.isArchived = false,
  })  : id = const Uuid().v4(),
        createdAt = DateTime.now();
}
