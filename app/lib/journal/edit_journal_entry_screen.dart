import 'package:cbt_journal/journal/edit_journal/edit_journal_controller.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:cbt_journal/util/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_it/watch_it.dart';

class EditJournalEntryScreen extends WatchingStatefulWidget {
  const EditJournalEntryScreen({
    super.key,
    required this.mode,
    this.guidedJournalId,
    this.journalId,
  });
  final EditJournalMode mode;
  final String? guidedJournalId;
  final String? journalId;

  @override
  State<EditJournalEntryScreen> createState() => _EditJournalEntryScreenState();
}

class _EditJournalEntryScreenState extends State<EditJournalEntryScreen> {
  final List<GuideQuestion> guideQuestions = [];
  JournalEntry? journalEntry;
  int currentQuestion = 0;

  late final TextEditingController titleController;
  late final TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    _load();

    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void _load() async {
    throwIf(
        widget.mode == EditJournalMode.create && widget.guidedJournalId == null,
        'Cannot create new journal without guided journal type.');
    throwIf(widget.mode == EditJournalMode.edit && widget.journalId == null,
        'Cannot edit journal without existing journal id.');

    await di<EditJournalController>()
        .load(widget.guidedJournalId, widget.journalId);
  }

  void _initializeJournal() {
    final guidedJournal = di<EditJournalController>().selectedGuidedJournal;

    if (widget.mode == EditJournalMode.create) {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (guidedJournal != null && userId != null) {
        journalEntry = JournalEntry.createNew(
            userId: userId,
            guidedJournal: widget.guidedJournalId!,
            title: guidedJournal.title,
            content: guidedJournal.guideQuestions
                .map((e) => GuideQuestion(
                      question: e,
                      answer: '',
                    ))
                .toList());
      }
    } else {
      journalEntry = di<EditJournalController>().selectedJournalEntry;
      contentController.text =
          getAtIndexOrNull(journalEntry!.content, currentQuestion)?.answer ??
              '';
    }

    if (journalEntry != null && guidedJournal != null) {
      for (final (i, val) in guidedJournal.journalType.indexed) {
        journalEntry!.content[i].type = val;
      }
      guideQuestions.clear();
      guideQuestions.addAll(journalEntry!.content);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loading =
        watchPropertyValue((EditJournalController c) => c.isLoading);
    if (loading) {
      return LoadingAnimationWidget.waveDots(
        color: Colors.blueGrey,
        size: 50,
      );
    }

    if (journalEntry == null) {
      _initializeJournal();
    }

    Icon nextButton = const Icon(Icons.arrow_forward);
    if (currentQuestion + 1 >= guideQuestions.length) {
      nextButton = const Icon(Icons.check);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            final previousQuestion = currentQuestion - 1;
            if (previousQuestion < 0) {
              context.pop(false);
            } else {
              setState(() {
                guideQuestions[currentQuestion].answer = contentController.text;
                contentController.text =
                    guideQuestions[previousQuestion].answer;
                currentQuestion = previousQuestion;
              });
            }
          },
        ),
      ),
      body: Container(
          margin: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 64.0),
          child: _InputWidget(
            guideQuestion: guideQuestions[currentQuestion],
            contentController: contentController,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nextQuestion = currentQuestion + 1;
          if (nextQuestion >= guideQuestions.length) {
            // Journal is completed
            guideQuestions[currentQuestion].answer = contentController.text;
            if (journalEntry != null) {
              journalEntry!.content = guideQuestions;
              await di<EditJournalController>()
                  .insertJournalEntry(journalEntry!);
            }

            if (di<EditJournalController>().selectedGuidedJournal?.title ==
                    'Set a Goal' &&
                widget.mode == EditJournalMode.create) {
              // TODO: Ask if user wants to create a goal
              if (context.mounted) {
                context.go('/goal/create/${journalEntry!.id}');
              }
            } else if (widget.mode == EditJournalMode.create) {
              if (context.mounted) {
                context.pushReplacement('/journal/confirm');
              }
            } else {
              if (context.mounted) context.pop(true);
            }
          } else {
            setState(() {
              guideQuestions[currentQuestion].answer = contentController.text;
              contentController.text = guideQuestions[nextQuestion].answer;
              currentQuestion = nextQuestion;
            });
          }
        },
        elevation: 1.0,
        child: nextButton,
      ),
    );
  }
}

class _InputWidget extends WatchingWidget {
  const _InputWidget(
      {required this.guideQuestion, required this.contentController});
  final GuideQuestion guideQuestion;
  final TextEditingController contentController;

  @override
  Widget build(BuildContext context) {
    if (guideQuestion.type == JournalType.mood) {
      return _MoodJournal(guideQuestion.question, contentController);
    } else {
      return _TextJournal(guideQuestion.question, contentController);
    }
  }
}

class _MoodJournal extends StatefulWidget {
  const _MoodJournal(this.guideQuestion, this.contentController);
  final String guideQuestion;
  final TextEditingController contentController;

  @override
  State<_MoodJournal> createState() => _MoodJournalState();
}

class _MoodJournalState extends State<_MoodJournal> {
  String? selectedMood;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.guideQuestion),
        const SizedBox(height: 60.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Sentiment.values.map((e) {
            double opacity = 0.3;
            if (selectedMood == e.value) {
              opacity = 1.0;
            }
            return Opacity(
              opacity: opacity,
              child: IconButton(
                onPressed: () {
                  widget.contentController.text = e.value;
                  setState(() {
                    selectedMood = e.value;
                  });
                },
                icon: e.icon,
                iconSize: 40.0,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}

class _TextJournal extends WatchingWidget {
  const _TextJournal(this.guideQuestion, this.contentController);
  final String guideQuestion;
  final TextEditingController contentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(guideQuestion),
        const SizedBox(height: 12.0),
        Expanded(
            child: TextField(
          controller: contentController,
          maxLines: null,
          decoration: null,
        )),
      ],
    );
  }
}

enum EditJournalMode { create, edit }
