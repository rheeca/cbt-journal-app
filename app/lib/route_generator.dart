import 'package:cbt_journal/discover/discover_screen.dart';
import 'package:cbt_journal/goals/goals_screen.dart';
import 'package:cbt_journal/home/home_screen.dart';
import 'package:cbt_journal/journal/journal_screen.dart';
import 'package:cbt_journal/settings/edit_profile.dart';
import 'package:cbt_journal/user/sign_in_screen.dart';
import 'package:cbt_journal/goals/edit_goal/edit_goal.dart';
import 'package:cbt_journal/goals/view_goal.dart';
import 'package:cbt_journal/journal/confirm_create_journal_screen.dart';
import 'package:cbt_journal/journal/edit_journal/edit_journal_entry_screen.dart';
import 'package:cbt_journal/journal/view_journal_entry_screen.dart';
import 'package:cbt_journal/settings/settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

GoRouter getRouter(User? user) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ScaffoldWithNavBar(
            child: child,
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/discover',
            builder: (context, state) => const DiscoverScreen(),
          ),
          GoRoute(
            path: '/goals',
            builder: (context, state) => const GoalsScreen(),
          ),
          GoRoute(
            path: '/myjournal',
            builder: (context, state) => const JournalScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
            routes: <RouteBase>[
              GoRoute(
                path: 'edit',
                builder: (context, state) => const EditProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => const SignInScreen(),
      ),

      // Journal
      GoRoute(
        path: '/journal/view/:journal_id',
        builder: (context, state) {
          return ViewJournalEntryScreen(
            journalId: state.pathParameters['journal_id']!,
          );
        },
      ),
      GoRoute(
        path: '/journal/create/:guided_journal_id',
        builder: (context, state) {
          return EditJournalEntryScreen(
            mode: EditMode.create,
            guidedJournalId: state.pathParameters['guided_journal_id']!,
          );
        },
      ),
      GoRoute(
        path: '/journal/edit/:journal_id',
        builder: (context, state) {
          return EditJournalEntryScreen(
            mode: EditMode.edit,
            journalId: state.pathParameters['journal_id']!,
          );
        },
      ),
      GoRoute(
        path: '/journal/confirm',
        builder: (context, state) {
          return const ConfirmCreateJournalScreen();
        },
      ),

      // Goal
      GoRoute(
        path: '/goal/view/:goal_id',
        builder: (context, state) {
          return ViewGoalScreen(
            goalId: state.pathParameters['goal_id']!,
          );
        },
      ),
      GoRoute(
        path: '/goal/create',
        builder: (context, state) {
          return const EditGoalScreen();
        },
      ),
      GoRoute(
        path: '/goal/edit/:goal_id',
        builder: (context, state) {
          return EditGoalScreen(
            goalId: state.pathParameters['goal_id']!,
          );
        },
      ),
    ],
    redirect: (context, state) {
      if (user == null) {
        return '/signin';
      } else {
        return null;
      }
    },
  );
}

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (int index) {
          _onItemTapped(index, context);
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: 'Discover',
          ),
          NavigationDestination(
            icon: Icon(Icons.emoji_events),
            label: 'Goals',
          ),
          NavigationDestination(
            icon: Icon(Icons.event_note),
            label: 'My Journal',
          ),
        ],
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/discover')) {
      return 1;
    }
    if (location.startsWith('/goals')) {
      return 2;
    }
    if (location.startsWith('/myjournal')) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
      case 1:
        context.go('/discover');
      case 2:
        context.go('/goals');
      case 3:
        context.go('/myjournal');
    }
  }
}
