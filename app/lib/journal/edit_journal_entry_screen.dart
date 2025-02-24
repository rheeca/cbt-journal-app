import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:cbt_journal/models/journal_entry.dart';
import 'package:cbt_journal/user/user_controller.dart';
import 'package:cbt_journal/util/util.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class EditJournalEntryScreen extends WatchingStatefulWidget {
  const EditJournalEntryScreen(
      {super.key, required this.mode, required this.guidedJournal});
  final EditJournalMode mode;
  final GuidedJournal guidedJournal;

  @override
  State<EditJournalEntryScreen> createState() => _EditJournalEntryScreenState();
}

class _EditJournalEntryScreenState extends State<EditJournalEntryScreen> {
  List<String> guideQuestions = [];
  List<JournalType> journalTypes = [];
  int currentQuestion = 0;
  JournalEntry? journalEntry;

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    guideQuestions = widget.guidedJournal.guideQuestions;
    journalTypes = widget.guidedJournal.journalType;

    if (widget.mode == EditJournalMode.edit) {
      journalEntry = di<JournalController>().selectedJournalEntry;
      contentController.text =
          getAtIndexOrNull(journalEntry!.content, currentQuestion) ?? '';
    } else {
      journalEntry = JournalEntry.createNew(
          userId: di<UserController>().currentUser!.userId,
          guidedJournal: widget.guidedJournal.id,
          title: widget.guidedJournal.title,
          content: []);
      di<JournalController>().selectedJournalEntry = journalEntry;
    }
  }

  @override
  Widget build(BuildContext context) {
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
              Navigator.pop(context);
            } else {
              setState(() {
                updateOrAppend(journalEntry!.content, currentQuestion,
                    contentController.text);
                contentController.text =
                    getAtIndexOrNull(journalEntry!.content, previousQuestion) ??
                        '';
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
            journalType: journalTypes[currentQuestion],
            contentController: contentController,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nextQuestion = currentQuestion + 1;
          if (nextQuestion >= guideQuestions.length) {
            // Journal is completed
            updateOrAppend(
                journalEntry!.content, currentQuestion, contentController.text);
            await di<AppDatabase>().insertJournalEntry(journalEntry!);
            di<JournalController>().loadJournalEntries();

            if (widget.guidedJournal.title == 'Set a Goal' &&
                widget.mode == EditJournalMode.create) {
              // TODO: Ask if user wants to create a goal
              if (context.mounted) {
                Navigator.popAndPushNamed(context, '/goal/create');
              }
            } else if (widget.mode == EditJournalMode.create) {
              if (context.mounted) {
                Navigator.popAndPushNamed(
                    context, '/journal-entry/create/confirm');
              }
            } else {
              if (context.mounted) Navigator.pop(context);
            }
          } else {
            setState(() {
              updateOrAppend(journalEntry!.content, currentQuestion,
                  contentController.text);
              contentController.text =
                  getAtIndexOrNull(journalEntry!.content, nextQuestion) ?? '';
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
      {required this.guideQuestion,
      required this.journalType,
      required this.contentController});
  final String guideQuestion;
  final JournalType journalType;
  final TextEditingController contentController;

  @override
  Widget build(BuildContext context) {
    if (journalType == JournalType.mood) {
      return _MoodJournal(guideQuestion, contentController);
    } else {
      return _TextJournal(guideQuestion, contentController);
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
