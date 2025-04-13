import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cbt_journal/journal/edit_journal/edit_journal_controller.dart';
import 'package:cbt_journal/journal/edit_journal/stack_objects.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:cbt_journal/util/util.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stack_board/flutter_stack_board.dart';
import 'package:stack_board/stack_board_item.dart';
import 'package:stack_board/stack_case.dart';
import 'package:stack_board/stack_items.dart';
import 'package:watch_it/watch_it.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class EditJournalEntryScreen extends WatchingStatefulWidget {
  const EditJournalEntryScreen({
    super.key,
    required this.mode,
    this.guidedJournalId,
    this.journalId,
  });
  final EditMode mode;
  final String? guidedJournalId;
  final String? journalId;

  @override
  State<EditJournalEntryScreen> createState() => _EditJournalEntryScreenState();
}

class _EditJournalEntryScreenState extends State<EditJournalEntryScreen> {
  final List<GuideQuestion> guideQuestions = [];
  JournalEntry? journalEntry;
  int currentQuestion = 0;
  AnswerType answerType = AnswerType.text;

  late final TextEditingController titleController;
  late final TextEditingController contentController;
  late final StackBoardController boardController;
  late final WidgetsToImageController toImageController;

  @override
  void initState() {
    super.initState();
    _load();

    titleController = TextEditingController();
    contentController = TextEditingController();
    boardController = StackBoardController();
    toImageController = WidgetsToImageController();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    boardController.dispose();
    super.dispose();
  }

  void _load() async {
    throwIf(widget.mode == EditMode.create && widget.guidedJournalId == null,
        'Cannot create new journal without guided journal type.');
    throwIf(widget.mode == EditMode.edit && widget.journalId == null,
        'Cannot edit journal without existing journal id.');

    await di<EditJournalController>()
        .load(widget.guidedJournalId, widget.journalId);
  }

  void _initializeJournal() {
    final guidedJournal = di<EditJournalController>().selectedGuidedJournal;

    if (widget.mode == EditMode.create) {
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
      loadBoard(getAtIndexOrNull(journalEntry!.content, currentQuestion)
              ?.answerCanvasElements ??
          '[]');
    }

    if (journalEntry != null && guidedJournal != null) {
      for (final (i, val) in guidedJournal.journalType.indexed) {
        journalEntry!.content[i].type = val;
      }
      guideQuestions.clear();
      guideQuestions.addAll(journalEntry!.content);
    }
  }

  void loadBoard(String jsonString) {
    boardController.clear();
    final List<dynamic> items = jsonDecode(jsonString) as List<dynamic>;

    for (final dynamic item in items) {
      if (item['type'] == 'StackTextItem') {
        boardController.addItem(
          StackTextItem.fromJson(item),
        );
      } else if (item['type'] == 'StackImageItem') {
        boardController.addItem(
          StackImageItem.fromJson(item),
        );
      } else if (item['type'] == 'ColorStackItem') {
        boardController.addItem(
          ColorStackItem.fromJson(item),
        );
      } else if (item['type'] == 'StackDrawItem') {
        boardController.addItem(
          StackDrawItem.fromJson(item),
        );
      }
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
          onPressed: () async {
            final previousQuestion = currentQuestion - 1;
            if (previousQuestion < 0) {
              if (context.canPop()) {
                context.pop(false);
              } else {
                context.go('/discover');
              }
            } else {
              final elements = boardController.getAllData();
              Uint8List? image;
              if (elements.isNotEmpty) {
                image = await toImageController.capture();
              }

              setState(() {
                guideQuestions[currentQuestion].answer = contentController.text;
                contentController.text =
                    guideQuestions[previousQuestion].answer;
                guideQuestions[currentQuestion].answerCanvasElements =
                    jsonEncode(elements);
                guideQuestions[currentQuestion].answerCanvasImage = image;
                loadBoard(
                    guideQuestions[previousQuestion].answerCanvasElements);
                currentQuestion = previousQuestion;
              });
            }
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (answerType == AnswerType.text) {
                    answerType = AnswerType.canvas;
                  } else {
                    answerType = AnswerType.text;
                  }
                });
              },
              icon: const Icon(Icons.draw))
        ],
      ),
      body: Container(
          margin: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 64.0),
          child: _InputWidget(
            guideQuestion: guideQuestions[currentQuestion],
            contentController: contentController,
            answerType: answerType,
            boardController: boardController,
            toImageController: toImageController,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nextQuestion = currentQuestion + 1;
          if (nextQuestion >= guideQuestions.length) {
            // Journal is completed
            guideQuestions[currentQuestion].answer = contentController.text;
            guideQuestions[currentQuestion].answerCanvasElements =
                jsonEncode(boardController.getAllData());
            if (boardController.getAllData().isNotEmpty) {
              guideQuestions[currentQuestion].answerCanvasImage =
                  await toImageController.capture();
            }
            if (journalEntry != null) {
              journalEntry!.content = guideQuestions;
              await di<EditJournalController>()
                  .insertJournalEntry(journalEntry!);
            }

            if (widget.mode == EditMode.create) {
              if (context.mounted) {
                context.pushReplacement('/journal/confirm');
              }
            } else {
              if (context.mounted) context.pop(true);
            }
          } else {
            final elements = boardController.getAllData();
            Uint8List? image;
            if (elements.isNotEmpty) {
              image = await toImageController.capture();
            }

            setState(() {
              guideQuestions[currentQuestion].answer = contentController.text;
              contentController.text = guideQuestions[nextQuestion].answer;
              guideQuestions[currentQuestion].answerCanvasElements =
                  jsonEncode(elements);
              guideQuestions[currentQuestion].answerCanvasImage = image;
              loadBoard(guideQuestions[nextQuestion].answerCanvasElements);
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
  const _InputWidget({
    required this.guideQuestion,
    required this.contentController,
    required this.answerType,
    required this.boardController,
    required this.toImageController,
  });
  final GuideQuestion guideQuestion;
  final TextEditingController contentController;
  final AnswerType answerType;
  final StackBoardController boardController;
  final WidgetsToImageController toImageController;

  @override
  Widget build(BuildContext context) {
    if (guideQuestion.type == JournalType.mood) {
      return _MoodJournal(guideQuestion.question, contentController);
    } else if (guideQuestion.type == JournalType.distortion) {
      return _DistortionJournal(guideQuestion.question, contentController);
    } else if (answerType == AnswerType.canvas) {
      return _CanvasJournal(
        guideQuestion.question,
        boardController,
        toImageController,
      );
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

class _DistortionJournal extends StatefulWidget {
  const _DistortionJournal(this.guideQuestion, this.contentController);
  final String guideQuestion;
  final TextEditingController contentController;

  @override
  State<_DistortionJournal> createState() => _DistortionJournalState();
}

class _DistortionJournalState extends State<_DistortionJournal> {
  final Set<CognitiveDistortion> selectedDistortions = {};

  @override
  void initState() {
    super.initState();
    final elements = widget.contentController.text
        .split(',')
        .map((e) => CognitiveDistortion.getByName(e))
        .whereType<CognitiveDistortion>()
        .toList();
    selectedDistortions.addAll(elements);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.guideQuestion),
        const SizedBox(height: 12.0),
        Expanded(
          child: ListView(
            children: CognitiveDistortion.values.map((e) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedDistortions.contains(e)
                        ? Theme.of(context).primaryColor.withValues(alpha: 0.3)
                        : null,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(e.label),
                    subtitle: Text(e.description),
                    onTap: () {
                      setState(() {
                        selectedDistortions.contains(e)
                            ? selectedDistortions.remove(e)
                            : selectedDistortions.add(e);
                      });
                      widget.contentController.text =
                          selectedDistortions.map((e) => e.name).join(',');
                    },
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}

class _CanvasJournal extends WatchingWidget {
  const _CanvasJournal(
    this.guideQuestion,
    this.controller,
    this.toImageController,
  );
  final String guideQuestion;
  final StackBoardController controller;
  final WidgetsToImageController toImageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(guideQuestion),
          const SizedBox(height: 12.0),
          Expanded(
              child: WidgetsToImage(
            controller: toImageController,
            child: CustomStackBoard(controller: controller),
          )),
        ],
      ),
      floatingActionButton: Row(
        children: <Widget>[
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 25),
                  FloatingActionButton(
                      heroTag: null,
                      onPressed: _addTextItem,
                      child: const Icon(Icons.border_color)),
                  const SizedBox(width: 5),
                  FloatingActionButton(
                      heroTag: null,
                      onPressed: _addCustomItem,
                      child: const Icon(Icons.add_box)),
                  const SizedBox(width: 5),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: _addDrawItem,
                    child: const Icon(Icons.palette),
                  ),
                  const SizedBox(width: 5),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () => controller.clear(),
                    child: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addTextItem() {
    controller.addItem(
      StackTextItem(
        size: const Size(200, 100),
        content: TextItemContent(data: 'Text', softWrap: true),
      ),
    );
  }

  void _addCustomItem() {
    final Color color =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    controller.addItem(
      ColorStackItem(
        size: const Size.square(100),
        content: ColorContent(color: color),
      ),
    );
  }

  void _addDrawItem() {
    controller.addItem(StackDrawItem(size: const Size.square(300)));
  }
}

class CustomStackBoard extends StatelessWidget {
  const CustomStackBoard({
    super.key,
    required this.controller,
  });

  final StackBoardController controller;

  @override
  Widget build(BuildContext context) {
    return StackBoard(
      onDel: (StackItem<StackItemContent> item) => _onDelete(context, item),
      controller: controller,
      background: const ColoredBox(color: Colors.white),
      customBuilder: (StackItem<StackItemContent> item) {
        if (item is StackTextItem) {
          return StackTextCase(item: item);
        } else if (item is StackDrawItem) {
          return StackDrawCase(item: item);
        } else if (item is StackImageItem) {
          return StackImageCase(item: item);
        } else if (item is ColorStackItem) {
          return Container(
            width: item.size.width,
            height: item.size.height,
            color: item.content?.color,
          );
        }

        return const SizedBox();
      },
    );
  }

  Future<void> _onDelete(
      BuildContext context, StackItem<StackItemContent> item) async {
    final bool? resp = await showDialog<bool>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Delete?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () => Navigator.pop(context, false),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelMedium),
              child: const Text('Yes'),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );

    if (resp == true) {
      controller.removeById(item.id);
    }
  }
}

enum EditMode { create, edit }

enum CognitiveDistortion {
  allOrNothing(label: 'All-or-nothing thinking', description: ''),
  catastrophizing(label: 'Catastrophizing', description: ''),
  minimizingPositive(label: 'Minimizing the positive', description: ''),
  emotionalReasoning(label: 'Emotional reasoning', description: ''),
  labeling(label: 'Labeling', description: '');

  const CognitiveDistortion({required this.label, required this.description});
  final String label;
  final String description;

  static CognitiveDistortion? getByName(String name) {
    return CognitiveDistortion.values.firstWhereOrNull((e) => e.name == name);
  }
}
