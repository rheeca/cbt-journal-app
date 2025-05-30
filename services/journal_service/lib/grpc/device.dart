import 'package:grpc/grpc.dart';
import 'package:journal_service/database/database.dart';
import 'package:journal_service/generated/device.pbgrpc.dart';
import 'package:journal_service/models/device.dart';
import 'package:journal_service/utils/logger.dart';

class DeviceService extends DeviceServiceBase {
  DeviceService(this.database);
  final AppDatabase database;

  @override
  Future<SyncResponse> sync(ServiceCall call, SyncRequest request) async {
    final goalsToDelete = <String>[];
    final entriesToDelete = <String>[];
    final usersToDelete = <String>[];

    try {
      await database.insertDevices([
        Device(
          id: request.id,
          userId: request.userId,
          lastSynced: DateTime.now().toUtc(),
        )
      ]);

      final devices = await database.getDevices(request.userId);
      if (devices.isNotEmpty) {
        final stalestSync = devices
            .map((e) => e.lastSynced)
            .reduce((a, b) => a.isBefore(b) ? a : b);

        final goals =
            await database.getGoalsByUser(request.userId, isDeleted: true);
        goalsToDelete.addAll(goals
            .where((e) => e.updatedAt.toDateTime().isBefore(stalestSync))
            .map((e) => e.id)
            .toList());
        if (goalsToDelete.isNotEmpty) {
          await database.deleteGoals(goalsToDelete);
        }

        final journalEntries = await database
            .getJournalEntriesByUser(request.userId, isDeleted: true);
        entriesToDelete.addAll(journalEntries
            .where((e) => e.updatedAt.toDateTime().isBefore(stalestSync))
            .map((e) => e.id)
            .toList());
        if (entriesToDelete.isNotEmpty) {
          await database.deleteJournalEntries(entriesToDelete);
        }

        final users =
            await database.getUsers([request.userId], isDeleted: true);
        usersToDelete.addAll(users.map((e) => e.id).toList());
        if (usersToDelete.isNotEmpty) {
          await database.deleteUsers(usersToDelete);
        }
      }
    } catch (e) {
      logger.e('failed to sync device', error: e);
      return SyncResponse(
        status: 400,
      );
    }

    return SyncResponse(
      status: 200,
      deletedGoals: goalsToDelete,
      deletedJournalEntries: entriesToDelete,
    );
  }

  @override
  Future<LogoutResponse> logout(ServiceCall call, LogoutRequest request) async {
    try {
      await database.deleteDevices([request.id]);
    } catch (e) {
      return LogoutResponse(
        status: 400,
      );
    }

    return LogoutResponse(status: 200);
  }
}
