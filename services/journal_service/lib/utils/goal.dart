import 'dart:convert';

import 'package:journal_service/generated/goal.pb.dart';

extension Conversion on GuideQuestion {
  Map<String, String> toMap() {
    return <String, String>{
      'question': question,
      'answer': answer,
      'type': type,
      'answerType': answerType,
      'answerCanvasElements': answerCanvasElements,
      'answerCanvasImage': base64Encode(answerCanvasImage),
    };
  }
}

GuideQuestion guideQuestionFromMap(Map<String, String> map) {
  return GuideQuestion(
    question: map['question'],
    answer: map['answer'],
    type: map['type'],
    answerType: map['answerType'],
    answerCanvasElements: map['answerCanvasElements'],
    answerCanvasImage: (map['answerCanvasImage'] ?? '').isNotEmpty
        ? base64Decode(map['answerCanvasImage']!)
        : null,
  );
}
