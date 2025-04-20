import 'dart:convert';
import 'dart:typed_data';

import 'package:cbt_journal/generated/goal.pb.dart' as pb;
import 'package:cbt_journal/models/journal_entry.dart';

class GuideQuestion {
  String question;
  String answer;
  JournalType type;
  AnswerType answerType;
  String answerCanvasElements;
  Uint8List? answerCanvasImage;

  GuideQuestion({
    required this.question,
    required this.answer,
    this.type = JournalType.text,
    this.answerType = AnswerType.text,
    this.answerCanvasElements = '[]',
    this.answerCanvasImage,
  });

  GuideQuestion.fromPb(pb.GuideQuestion g)
      : question = g.question,
        answer = g.answer,
        type = JournalType.getByName(g.type)!,
        answerType = AnswerType.getByName(g.answerType)!,
        answerCanvasElements = g.answerCanvasElements,
        answerCanvasImage = Uint8List.fromList(g.answerCanvasImage);

  Map<String, String> toMap() {
    return <String, String>{
      'question': question,
      'answer': answer,
      'type': type.name,
      'answerType': answerType.name,
      'answerCanvasElements': answerCanvasElements,
      'answerCanvasImage':
          answerCanvasImage != null ? base64Encode(answerCanvasImage!) : '',
    };
  }

  GuideQuestion.fromMap(Map<String, String> map)
      : question = map['question'] ?? '',
        answer = map['answer'] ?? '',
        type = JournalType.getByName(map['type'] ?? '') ?? JournalType.text,
        answerType =
            AnswerType.getByName(map['answerType'] ?? '') ?? AnswerType.text,
        answerCanvasElements = map['answerCanvasElements'] ?? '[]',
        answerCanvasImage = (map['answerCanvasImage'] ?? '').isNotEmpty
            ? base64Decode(map['answerCanvasImage']!)
            : null;
}

class SyncLog {
  SyncLog(this.id, this.type);

  final String id;
  final DatabaseType type;
}

enum DatabaseType { goalCheckIn, goal, journalEntry, user }

enum DayOfWeek {
  monday(singleLetter: 'M'),
  tuesday(singleLetter: 'T'),
  wednesday(singleLetter: 'W'),
  thursday(singleLetter: 'T'),
  friday(singleLetter: 'F'),
  saturday(singleLetter: 'S'),
  sunday(singleLetter: 'S');

  const DayOfWeek({required this.singleLetter});
  final String singleLetter;
}
