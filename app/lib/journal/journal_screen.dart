import 'package:cbt_journal/common/navigation.dart';
import 'package:cbt_journal/goals/edit_goal/edit_goal.dart';
import 'package:cbt_journal/journal/day_view/day_view_screen.dart';
import 'package:cbt_journal/journal/edit_journal/edit_journal_controller.dart';
import 'package:cbt_journal/journal/journal_controller.dart';
import 'package:cbt_journal/models/journal_entry.dart';
import 'package:cbt_journal/theme.dart';
import 'package:cbt_journal/util/util.dart';
import 'package:collection/collection.dart';
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
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: AppColor.lightYellow.color,
            ),
          ),
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
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
            backgroundColor: Colors.transparent,
          ),
        ],
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
    final groupedJournals =
        groupBy(journalEntries, (e) => dateOnlyUtc(e.createdAt).toLocal());
    final sortedByKeyMap = Map.fromEntries(groupedJournals.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key)));

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: sortedByKeyMap.entries
              .map(
                (e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                          DateFormat('MMMM dd, yyyy').format(e.key.toLocal()),
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                    ),
                    Column(
                      children: e.value
                          .map((e) => JournalEntryCard(entry: e))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class JournalEntryCard extends StatelessWidget {
  const JournalEntryCard({super.key, required this.entry});
  final JournalEntry entry;

  @override
  Widget build(BuildContext context) {
    Widget? icon;
    String text = '';
    final journalType = GuidedJournalType.values.byName(entry.guidedJournal);
    if (journalType == GuidedJournalType.dailyCheckIn) {
      icon = Sentiment.getSentimentByValue(entry.content[0].answer)?.icon ??
          Sentiment.neutral.icon;
      text = entry.content[1].answer;
    } else {
      icon = Icon(journalType.icon);
      if (journalType == GuidedJournalType.challengeThought) {
        text = entry.content[2].answer;
      } else {
        text = entry.content[0].answer;
      }
    }

    return Card(
      elevation: 0,
      color: AppColor.white.color,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          entry.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          DateFormat('kk:mm').format(entry.createdAt.toLocal()),
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                    Text(
                      text,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          context.push('/journal/view/${entry.id}');
        },
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
  String _dropdownSelect = GuidedJournalType.values.first.title;

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

    final createdAt = user.createdAt.toDateTime();
    final firstDay = DateTime(
      createdAt.year,
      createdAt.month,
      createdAt.day,
    );

    final guidedJournals =
        watchPropertyValue((JournalController c) => c.guidedJournals);

    final goals = watchPropertyValue((JournalController c) => c.goals);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              const Expanded(child: SizedBox()),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.white.color),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 500,
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10.0)),
                        ),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            width: double.infinity,
                            child: ListView(
                              children: [
                                buildGroup(
                                    "Journal Types",
                                    guidedJournals
                                        .map((e) => e.title)
                                        .toList()),
                                buildGroup("Goals",
                                    goals.map((e) => e.type.label).toList()),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    Text(_dropdownSelect),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Colors.white.withValues(alpha: 0.3),
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
            margin: const EdgeInsets.all(8),
            child: TableCalendar(
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
                          hasJournalEntry(day),
                          Text(day.day.toString()),
                        ],
                      ),
                    ),
                  );
                },
                selectedBuilder: _defaultDayBuilder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGroup(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ...items.map((e) => ListTile(
              onTap: () {
                setState(() {
                  _dropdownSelect = e;
                });
                context.pop();
              },
              title: Text(e),
            )),
      ],
    );
  }

  FocusedDayBuilder _defaultDayBuilder() {
    return (context, day, focusedDay) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hasJournalEntry(day),
            Text(day.day.toString()),
          ],
        ),
      );
    };
  }

  Widget hasJournalEntry(DateTime day) {
    final moodEntriesByDate = di<JournalController>().moodEntriesByDate;
    final journalEntriesByDate = di<JournalController>().journalEntriesByDate;
    final goalCheckIns = di<JournalController>().goalCheckIns;

    Icon? icon;

    if (_dropdownSelect == GuidedJournalType.dailyCheckIn.title) {
      final mood = moodEntriesByDate[DateFormat('yyyy-MM-d').format(day)]
          ?.content
          .first
          .answer;
      icon = mood != null ? Sentiment.getSentimentByValue(mood)?.icon : null;
    } else if (GuidedJournalType.values
        .map((e) => e.title)
        .contains(_dropdownSelect)) {
      final entries =
          journalEntriesByDate[DateFormat('yyyy-MM-d').format(day)] ?? [];
      icon = entries.where((e) => e.title == _dropdownSelect).isNotEmpty
          ? Icon(GuidedJournalType.getByTitle(_dropdownSelect)?.icon)
          : null;
    } else {
      final checkIn = goalCheckIns.firstWhereOrNull((e) {
        return DateUtils.isSameDay(e.date, day);
      });

      if (checkIn != null) {
        final goalActivity = GoalActivity.getByLabel(_dropdownSelect)!;
        icon = checkIn.goals.contains(goalActivity.name)
            ? Icon(goalActivity.icon)
            : null;
      }
    }

    if (icon != null) {
      return icon;
    } else {
      return const SizedBox(height: 24.0);
    }
  }
}

enum GuidedJournalType {
  dailyCheckIn('Daily Check-in', Icons.note_alt),
  gratitude('Gratitude', Icons.volunteer_activism),
  setAGoal('Set a Goal', Icons.emoji_events),
  challengeThought('Challenge Thought', Icons.emoji_objects),
  celebrateWins('Celebrate Wins', Icons.celebration);

  const GuidedJournalType(this.title, this.icon);
  final String title;
  final IconData icon;

  static GuidedJournalType? getByTitle(String title) {
    return GuidedJournalType.values.firstWhereOrNull((e) => e.title == title);
  }
}
