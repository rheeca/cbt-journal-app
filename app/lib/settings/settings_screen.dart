import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/user/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:watch_it/watch_it.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class SettingsScreen extends StatefulWidget with WatchItStatefulWidgetMixin {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  final _formkey = GlobalKey<FormState>();
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = watchPropertyValue((UserController c) => c.currentUser);

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('Error')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Edit'),
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Settings', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Name'),
                  Text(user.displayName),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Email'),
                  Text(user.email),
                ],
              ),
              const SizedBox(height: 50.0),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: null),
                child: const Text('Change Password'),
              ),
              const SizedBox(height: 12.0),
              TextButton(
                onPressed: () => _showDeleteAccountDialog(context),
                child: const Text('Delete Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDeleteAccountDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Enter your password to continue.',
              ),
              Form(
                key: _formkey,
                child: TextFormField(
                  controller: _passwordController,
                  validator:
                      RequiredValidator(errorText: 'Password is required').call,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelMedium),
              child: const Text('Delete'),
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;

                if (user == null) {
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                  return;
                }

                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: user.email ?? '',
                    password: _passwordController.text,
                  );
                } catch (e) {
                  logger.e('Failed to reauthenticate user.', error: e);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                  return;
                }

                await di<AppDatabase>().deleteUser(user.uid);
                await user.delete();

                if (context.mounted) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacementNamed(context, '/auth/sign-in');
                }
              },
            ),
          ],
        );
      },
    );
  }
}
