import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/journal_entry.dart';
import 'package:cbt_journal/models/user.dart';
import 'package:cbt_journal/util/util.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class EditJournalEntryScreen extends WatchingStatefulWidget {
  const EditJournalEntryScreen({super.key, required this.guidedJournal});
  final GuidedJournal guidedJournal;

  @override
  State<EditJournalEntryScreen> createState() => _EditJournalEntryScreenState();
}

class _EditJournalEntryScreenState extends State<EditJournalEntryScreen> {
  List<String> guideQuestions = [];
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
    journalEntry = JournalEntry.createNew(
        userId: di<CurrentUser>().userId,
        guidedJournal: widget.guidedJournal.id,
        title: widget.guidedJournal.title,
        content: []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 64.0),
        child: Column(
          children: [
            Text(guideQuestions[currentQuestion]),
            const SizedBox(height: 12.0),
            Expanded(
                child: TextField(
              controller: contentController,
              maxLines: null,
              decoration: null,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nextQuestion = currentQuestion + 1;
          if (nextQuestion >= guideQuestions.length) {
            // Journal is completed
            updateOrAppend(
                journalEntry!.content, currentQuestion, contentController.text);
            await di<AppDatabase>().insertJournalEntry(journalEntry!);
            if (context.mounted) Navigator.pop(context);
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
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
