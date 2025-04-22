import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:journal_service/database/database.dart';
import 'package:journal_service/grpc/goal.dart';
import 'package:journal_service/grpc/goal_checkin.dart';
import 'package:journal_service/grpc/journal_entry.dart';
import 'package:journal_service/utils/logger.dart';
import 'package:journal_service/grpc/user.dart';
import 'package:logger/logger.dart';

var logger = Logger(filter: NoFilter());

void main() async {
  final database = AppDatabase();

  final grpcServer = Server.create(
    services: [
      GoalCheckInService(database),
      GoalService(database),
      JournalEntryService(database),
      UserService(database)
    ],
    codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await grpcServer.serve(
      port: int.parse(Platform.environment['PORT'] ?? '8080'));

  logger.d('Hello! Serving at port ${grpcServer.port}');
}
