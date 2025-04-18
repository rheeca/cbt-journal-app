import 'package:grpc/grpc.dart';
import 'package:journal_service/database/database.dart';
import 'package:journal_service/generated/journal_entry.pbgrpc.dart';
import 'package:journal_service/utils/logger.dart';
import 'package:logger/logger.dart';

var logger = Logger(filter: NoFilter());

class JournalEntryService extends JournalEntryServiceBase {
  final database = AppDatabase();

  @override
  Future<ReadJournalEntriesResponse> readJournalEntries(
      ServiceCall call, ReadJournalEntriesRequest request) async {
    final List<JournalEntry> journalEntries = [];
    try {
      final res = await database.getJournalEntriesByUser(request.userId);
      journalEntries.addAll(res);
    } catch (e) {
      logger.e('failed to read journal entries from database', error: e);
    }

    return ReadJournalEntriesResponse(journalEntries: journalEntries);
  }

  @override
  Future<WriteJournalEntriesResponse> writeJournalEntries(
      ServiceCall call, WriteJournalEntriesRequest request) async {
    try {
      await database.insertJournalEntries(request.journalEntries);
    } catch (e) {
      logger.e('failed to insert journal entries into database', error: e);
      return WriteJournalEntriesResponse(
        status: 500,
        errorMessage: 'failed to insert journal entries into database',
      );
    }

    return WriteJournalEntriesResponse(status: 200);
  }

  @override
  Future<DeleteJournalEntriesResponse> deleteJournalEntries(
      ServiceCall call, DeleteJournalEntriesRequest request) async {
    try {
      await database.deleteJournalEntries(request.ids);
    } catch (e) {
      logger.e('failed to delete journal entries from database', error: e);
      return DeleteJournalEntriesResponse(
        status: 500,
        errorMessage: 'failed to delete journal entries from database',
      );
    }

    return DeleteJournalEntriesResponse(status: 200);
  }
}
