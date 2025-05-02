import 'package:grpc/grpc.dart';
import 'package:journal_service/database/database.dart';
import 'package:journal_service/generated/goal.pbgrpc.dart';
import 'package:journal_service/utils/logger.dart';

class GoalService extends GoalServiceBase {
  GoalService(this.database);
  final AppDatabase database;

  @override
  Future<ReadGoalsResponse> readGoals(
      ServiceCall call, ReadGoalsRequest request) async {
    final List<Goal> goals = [];
    try {
      final res = await database.getGoalsByUser(request.userId,
          lastSynced: request.lastSynced.toDateTime());
      goals.addAll(res);
    } catch (e) {
      logger.e('failed to read goals from database', error: e);
    }

    return ReadGoalsResponse(goals: goals);
  }

  @override
  Future<WriteGoalsResponse> writeGoals(
      ServiceCall call, WriteGoalsRequest request) async {
    try {
      await database.insertGoals(request.goals);
    } catch (e) {
      logger.e('failed to insert goals into database', error: e);
      return WriteGoalsResponse(
        status: 500,
        errorMessage: 'failed to insert goals into database',
      );
    }

    return WriteGoalsResponse(status: 200);
  }

  @override
  Future<DeleteGoalsResponse> deleteGoals(
      ServiceCall call, DeleteGoalsRequest request) async {
    try {
      await database.deleteGoals(request.ids);
    } catch (e) {
      logger.e('failed to delete goals from database', error: e);
      return DeleteGoalsResponse(
        status: 500,
        errorMessage: 'failed to delete goals from database',
      );
    }

    return DeleteGoalsResponse(status: 200);
  }
}
