import 'package:cbt_journal/generated/goal.pbgrpc.dart';
import 'package:cbt_journal/generated/goal_checkin.pbgrpc.dart';
import 'package:cbt_journal/generated/journal_entry.pbgrpc.dart';
import 'package:cbt_journal/generated/user.pbgrpc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';

class JournalService {
  JournalService._internal();
  factory JournalService() {
    return JournalService._internal();
  }

  ClientChannel? _channel;
  GoalCheckInServiceClient? goalCheckInClient;
  GoalServiceClient? goalClient;
  JournalEntryServiceClient? journalEntryClient;
  UserServiceClient? userClient;

  Future<void> initialize() async {
    await dotenv.load(fileName: ".env");

    _channel = ClientChannel(
      dotenv.env['SERVICE_ENDPOINT'] ?? '',
      port: int.parse(dotenv.env['SERVICE_PORT'] ?? '443'),
      options: const ChannelOptions(credentials: ChannelCredentials.secure()),
    );
    goalCheckInClient = GoalCheckInServiceClient(_channel!);
    goalClient = GoalServiceClient(_channel!);
    journalEntryClient = JournalEntryServiceClient(_channel!);
    userClient = UserServiceClient(_channel!);
  }

  Future<void> dispose() async {
    userClient = null;
    await _channel?.shutdown();
  }
}
