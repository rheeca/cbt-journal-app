import 'package:cbt_journal/generated/journal_entry.pb.dart' as pb;
import 'package:cbt_journal/models/model.dart';
import 'package:cbt_journal/util/util.dart';
import 'package:collection/collection.dart';
import 'package:uuid/uuid.dart';

class JournalEntry {
  String id;
  String userId;
  DateTime createdAt;
  String guidedJournal;
  String title;
  List<GuideQuestion> content;
  DateTime updatedAt;
  bool isDeleted;

  JournalEntry({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.guidedJournal,
    required this.title,
    required this.content,
    required this.updatedAt,
    required this.isDeleted,
  });
  JournalEntry.createNew(
      {required this.userId,
      required this.guidedJournal,
      required this.title,
      required this.content})
      : id = const Uuid().v4(),
        createdAt = DateTime.now().toUtc(),
        updatedAt = DateTime.now().toUtc(),
        isDeleted = false;

  JournalEntry.fromPb(pb.JournalEntry e)
      : id = e.id,
        userId = e.userId,
        createdAt = e.createdAt.toDateTime(),
        guidedJournal = e.guidedJournal,
        title = e.title,
        content = e.content.map((e) => GuideQuestion.fromPb(e)).toList(),
        updatedAt = e.updatedAt.toDateTime(),
        isDeleted = e.isDeleted;

  pb.JournalEntry toPb() {
    return pb.JournalEntry(
      id: id,
      userId: userId,
      createdAt: createdAt.toProtoTimestamp(),
      guidedJournal: guidedJournal,
      title: title,
      content: content.map((e) => e.toPb()),
      updatedAt: updatedAt.toProtoTimestamp(),
      isDeleted: isDeleted,
    );
  }
}

class GuidedJournal {
  String id;
  String title;
  List<String> guideQuestions;
  String description;
  List<JournalType> journalType;

  GuidedJournal({
    required this.id,
    required this.title,
    required this.guideQuestions,
    required this.description,
    required this.journalType,
  });
  GuidedJournal.createNew(
      {required this.title,
      required this.guideQuestions,
      this.description = '',
      required this.journalType})
      : id = const Uuid().v4();
}

enum JournalType {
  mood,
  text,
  distortion;

  const JournalType();

  static JournalType? getByName(String name) {
    return JournalType.values.firstWhereOrNull((e) => e.name == name);
  }
}

enum AnswerType {
  text,
  canvas;

  const AnswerType();
  static AnswerType? getByName(String name) {
    return AnswerType.values.firstWhereOrNull((e) => e.name == name);
  }
}
