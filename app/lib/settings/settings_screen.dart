import 'package:cbt_journal/database/database.dart';
import 'package:cbt_journal/services/journal_service.dart';
import 'package:cbt_journal/settings/settings_controller.dart';
import 'package:cbt_journal/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _load();
    _passwordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _load() async {
    await di<SettingsController>().load();
  }

  @override
  Widget build(BuildContext context) {
    final loading = watchPropertyValue((SettingsController c) => c.loading);
    if (loading) {
      return LoadingAnimationWidget.waveDots(
        color: Colors.blueGrey,
        size: 50,
      );
    }
    final user = watchPropertyValue((SettingsController c) => c.currentUser);

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('No user')),
      );
    }

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: AppColor.white.color,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () async {
                  final updated = await context.push('/settings/edit');
                  if (updated == true) {
                    di<SettingsController>().load();
                  }
                },
                child: const Text('Edit'),
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Settings',
                      style: Theme.of(context).textTheme.titleLarge),
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
                    onPressed: () => _showChangePasswordDialog(context),
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
          backgroundColor: Colors.transparent,
        ),
      ],
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
                context.pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelMedium),
              child: const Text('Delete'),
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;

                if (user == null) {
                  if (context.mounted) context.pop();
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
                    context.pop();
                  }
                  return;
                }

                await di<AppDatabase>().deleteUser(user.uid);
                await di<JournalService>().onSync();
                await di<JournalService>().logoutDevice();
                await di<AppDatabase>().removeUser(user.uid);
                await user.delete();

                if (context.mounted) {
                  context.go('/signin');
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showChangePasswordDialog(BuildContext context) {
    _passwordController.text = '';
    _newPasswordController.text = '';
    _confirmPasswordController.text = '';

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Password'),
          content: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Password is required'),
                    ]).call,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Current Password',
                      labelText: 'Current Password',
                      errorStyle: TextStyle(fontSize: 14.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _newPasswordController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Password is required'),
                    ]).call,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'New Password',
                      labelText: 'New Password',
                      errorStyle: TextStyle(fontSize: 14.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    validator: (val) {
                      return MatchValidator(errorText: 'Passwords do not match')
                          .validateMatch(_newPasswordController.text,
                              _confirmPasswordController.text);
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Confirm password',
                      labelText: 'Confirm password',
                      errorStyle: TextStyle(fontSize: 14.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                context.pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelMedium),
              child: const Text('Update'),
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;

                if (user == null) {
                  if (context.mounted) {
                    context.pop();
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
                    context.pop();
                    return _showDialog(context, 'Wrong password.');
                  }
                }

                if (_formkey.currentState!.validate()) {
                  await user.updatePassword(_newPasswordController.text);
                } else {
                  if (context.mounted) {
                    context.pop();
                    return _showDialog(context, 'Passwords do not match.');
                  }
                }

                if (context.mounted) {
                  context.pop();
                  return _showDialog(context, 'Successfully changed password!');
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialog(BuildContext context, String text) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('Okay'),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
