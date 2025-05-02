import 'package:grpc/grpc.dart';
import 'package:journal_service/database/database.dart';
import 'package:journal_service/generated/discover.pbgrpc.dart';
import 'package:journal_service/utils/logger.dart';

class DiscoverService extends DiscoverServiceBase {
  DiscoverService(this.database);
  final AppDatabase database;

  @override
  Future<ReadGuidedJournalsResponse> readGuidedJournals(
      ServiceCall call, ReadGuidedJournalsRequest request) async {
    final List<GuidedJournal> journals = [];
    try {
      final res = await database.getGuidedJournals();
      journals.addAll(res);
    } catch (e) {
      logger.e('failed to get guided journals from db', error: e);
      return ReadGuidedJournalsResponse(
        status: 400,
        guidedJournals: [],
      );
    }

    return ReadGuidedJournalsResponse(
      status: 200,
      guidedJournals: journals,
    );
  }
}
