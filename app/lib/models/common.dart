import 'package:cbt_journal/models/journal_entry.dart';

class GuideQuestion {
  String question;
  String answer;
  JournalType type;

  GuideQuestion({
    required this.question,
    required this.answer,
    this.type = JournalType.text,
  });

  Map<String, String> toMap() {
    return <String, String>{
      'question': question,
      'answer': answer,
    };
  }

  GuideQuestion.fromMap(Map<String, String> map)
      : question = map['question'] ?? '',
        answer = map['answer'] ?? '',
        type = JournalType.text;
}

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
