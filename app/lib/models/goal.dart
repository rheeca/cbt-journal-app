import 'package:cbt_journal/generated/goal.pb.dart' as pb;
import 'package:cbt_journal/generated/goal_checkin.pb.dart' as pb_gc;
import 'package:cbt_journal/goals/edit_goal/edit_goal.dart';
import 'package:cbt_journal/models/model.dart';
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

  Goal.fromPb(pb.Goal g)
      : id = g.id,
        userId = g.userId,
        createdAt = g.createdAt.toDateTime(),
        title = g.title,
        type = GoalActivity.getByName(g.type)!,
        guideQuestions =
            g.guideQuestions.map((e) => GuideQuestion.fromPb(e)).toList(),
        notificationSchedule = g.notificationSchedule
            .map((e) => DayOfWeek.values.byName(e))
            .toList(),
        journalEntries = [],
        isArchived = g.isArchived,
        updatedAt = g.updatedAt.toDateTime(),
        isDeleted = g.isDeleted;

  pb.Goal toPb() {
    return pb.Goal(
      id: id,
      userId: userId,
      createdAt: createdAt.toProtoTimestamp(),
      title: title,
      type: type.name,
      guideQuestions: guideQuestions.map((e) => e.toPb()),
      notificationSchedule: notificationSchedule.map((e) => e.name).toList(),
      isArchived: isArchived,
      updatedAt: updatedAt.toProtoTimestamp(),
      isDeleted: isDeleted,
    );
  }
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

  GoalCheckIn.fromPb(pb_gc.GoalCheckIn g)
      : userId = g.userId,
        date = g.date.toDateTime(),
        goals = g.goals.toSet(),
        updatedAt = g.updatedAt.toDateTime(),
        isDeleted = g.isDeleted;

  pb_gc.GoalCheckIn toPb() {
    return pb_gc.GoalCheckIn(
      userId: userId,
      date: date.toProtoTimestamp(),
      goals: goals,
      updatedAt: updatedAt.toProtoTimestamp(),
      isDeleted: isDeleted,
    );
  }
}
