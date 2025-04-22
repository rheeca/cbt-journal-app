import 'package:cbt_journal/home/home_controller.dart';
import 'package:cbt_journal/services/journal_service.dart';
import 'package:cbt_journal/user/user_controller.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as ui;
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final providers = [ui.EmailAuthProvider()];

    return ui.SignInScreen(
      providers: providers,
      actions: [
        ui.AuthStateChangeAction<ui.UserCreated>((context, state) {
          di<UserController>().registered = false;
        }),
        ui.AuthStateChangeAction<ui.SignedIn>((context, state) async {
          await di<JournalService>().onSync();
          await di<HomeController>().load();
        }),
      ],
    );
  }
}
