import 'package:grpc/grpc.dart';
import 'package:journal_service/database/database.dart';
import 'package:journal_service/generated/goal_checkin.pbgrpc.dart';
import 'package:journal_service/utils/logger.dart';

class GoalCheckInService extends GoalCheckInServiceBase {
  GoalCheckInService(this.database);
  final AppDatabase database;

  @override
  Future<ReadGoalCheckInsResponse> readGoalCheckIns(
      ServiceCall call, ReadGoalCheckInsRequest request) async {
    final List<GoalCheckIn> goalCheckIns = [];
    try {
      final res = await database.getGoalCheckIns(request.userId,
          lastSynced: request.lastSynced.toDateTime());
      goalCheckIns.addAll(res);
    } catch (e) {
      logger.e('failed to read goal check-ins from database', error: e);
    }

    return ReadGoalCheckInsResponse(goalCheckIns: goalCheckIns);
  }

  @override
  Future<WriteGoalCheckInsResponse> writeGoalCheckIns(
      ServiceCall call, WriteGoalCheckInsRequest request) async {
    try {
      await database.insertGoalCheckIns(request.goalCheckIns);
    } catch (e) {
      logger.e('failed to insert goal check-ins into database', error: e);
      return WriteGoalCheckInsResponse(
        status: 500,
        errorMessage: 'failed to insert goal check-ins into database',
      );
    }

    return WriteGoalCheckInsResponse(status: 200);
  }
}
