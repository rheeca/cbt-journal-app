import 'package:cbt_journal/services/journal_service.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as ui;
import 'package:flutter/material.dart';

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
        ui.AuthStateChangeAction<ui.UserCreated>((context, state) async {
          await JournalService().onSync();
        }),
        ui.AuthStateChangeAction<ui.SignedIn>((context, state) {}),
      ],
    );
  }
}
