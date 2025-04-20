import 'package:cbt_journal/goals/edit_goal/edit_goal.dart';
import 'package:cbt_journal/models/common.dart';
import 'package:cbt_journal/util/util.dart';
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
  DateTime updatedAt;
  bool isDeleted;

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
    required this.updatedAt,
    required this.isDeleted,
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
        createdAt = DateTime.now().toUtc(),
        updatedAt = DateTime.now().toUtc(),
        isDeleted = false;
}

class GoalCheckIn {
  GoalCheckIn({
    required this.userId,
    required date,
    required this.goals,
    required this.updatedAt,
    required this.isDeleted,
  }) : date = dateOnlyUtc(date);

  final String userId;
  final DateTime date;
  final Set<String> goals;
  final DateTime updatedAt;
  final bool isDeleted;
}
