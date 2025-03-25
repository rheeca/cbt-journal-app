import 'package:cbt_journal/common/navigation.dart';
import 'package:cbt_journal/journal/day_view/day_view_screen.dart';
import 'package:cbt_journal/journal/edit_journal/edit_journal_controller.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:watch_it/watch_it.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Entries'),
              Tab(text: 'Calendar'),
            ],
          ),
        ),
        body: const TabBarView(children: [
          _JournalPage(),
          _CalendarPage(),
        ]),
        drawer: const AppDrawer(),
      ),
    );
  }
}

class _JournalPage extends WatchingStatefulWidget {
  const _JournalPage();

  @override
  State<_JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<_JournalPage> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    await di<JournalController>().load();
  }

  @override
  Widget build(BuildContext context) {
    final loading = watchPropertyValue((JournalController c) => c.isLoading);
    if (loading) {
      return LoadingAnimationWidget.waveDots(
        color: Colors.blueGrey,
        size: 50,
      );
    }

    final journalEntries =
        watchPropertyValue((JournalController c) => c.journalEntries);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: journalEntries
              .map((e) => Card(
                    child: InkWell(
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.title ?? 'Untitled',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                DateFormat('MMM-dd-yyyy kk:mm')
                                    .format(e.createdAt),
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                      ]),
                      onTap: () {
                        context.push('/journal/view/${e.id}');
                      },
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class _CalendarPage extends StatefulWidget with WatchItStatefulWidgetMixin {
  const _CalendarPage();

  @override
  State<_CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<_CalendarPage> {
  final DateTime now = DateTime.now();
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = now;
  }

  @override
  Widget build(BuildContext context) {
    final user = watchPropertyValue((JournalController c) => c.currentUser);
    if (user == null) {
      return const SizedBox();
    }

    final firstDay = DateTime(
      user.createdAt.year,
      user.createdAt.month,
      user.createdAt.day,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const DropdownMenu<String>(
            initialSelection: 'Mood',
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 'Mood', label: 'Mood'),
            ],
          ),
          TableCalendar(
            firstDay: firstDay,
            // last day of the current month
            lastDay: DateTime(now.year, now.month + 1, 0),
            focusedDay: _focusedDay,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) async {
              if (!isSameDay(_selectedDay, selectedDay)) {
                di<JournalController>().selectDate(selectedDay);
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return DayViewScreen(date: selectedDay);
                    },
                  ),
                );

                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: _defaultDayBuilder(),
              outsideBuilder: (context, day, focusedDay) => const SizedBox(),
              disabledBuilder: (context, day, focusedDay) {
                if (focusedDay.month != day.month) {
                  return const SizedBox();
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 24),
                      Text(
                        day.day.toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
              todayBuilder: (context, day, focusedDay) {
                return Center(
                  child: Container(
                    width: 40.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getMoodEntry(day),
                        Text(day.day.toString()),
                      ],
                    ),
                  ),
                );
              },
              selectedBuilder: _defaultDayBuilder(),
            ),
          ),
        ],
      ),
    );
  }

  FocusedDayBuilder _defaultDayBuilder() {
    return (context, day, focusedDay) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getMoodEntry(day),
            Text(day.day.toString()),
          ],
        ),
      );
    };
  }

  Widget getMoodEntry(DateTime day) {
    final moodEntries = di<JournalController>().moodEntriesByDate;
    final mood =
        moodEntries[DateFormat('yyyy-MM-d').format(day)]?.content.first.answer;
    final icon =
        mood != null ? Sentiment.getSentimentByValue(mood)?.icon : null;

    if (icon != null) {
      return icon;
    } else {
      return const SizedBox(height: 24.0);
    }
  }
}
