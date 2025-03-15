import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/models/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        ui.AuthStateChangeAction<ui.UserCreated>((context, state) async {
          final user = state.credential.user;
          if (user != null) {
            di<AppDatabase>().insertUser(UserModel(
              userId: user.uid,
              email: user.email ?? '',
              displayName: user.displayName ?? '',
            ));

            final firebaseUser = FirebaseAuth.instance.currentUser;

            if (firebaseUser != null && context.mounted) {
              Navigator.pushReplacementNamed(context, '/user/name/edit');
            } else if (context.mounted) {
              // TODO: Alert to failed sign-in
              Navigator.pushReplacementNamed(context, '/auth/sign-in');
            }
          } else if (context.mounted) {
            Navigator.pushReplacementNamed(context, '/auth/sign-in');
          }
        }),
        ui.AuthStateChangeAction<ui.SignedIn>((context, state) async {
          final firebaseUser = FirebaseAuth.instance.currentUser;
          if (firebaseUser != null && context.mounted) {
            Navigator.pushReplacementNamed(context, '/');
          } else if (context.mounted) {
            // TODO: Alert to failed sign-in
            Navigator.popAndPushNamed(context, '/auth/sign-in');
          }
        }),
      ],
    );
  }
}
