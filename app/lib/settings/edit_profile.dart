import 'dart:developer';

import 'package:cbt_journal/models/model.dart';
import 'package:cbt_journal/settings/settings_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_it/watch_it.dart';

class EditProfileScreen extends StatefulWidget with WatchItStatefulWidgetMixin {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserModel? user =
        watchPropertyValue((SettingsController c) => c.currentUser);

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('No user')),
      );
    }

    _nameController.text = user.displayName;
    _emailController.text = user.email;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          spacing: 12.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Update Name'),
            TextFormField(
              controller: _nameController,
            ),
            const SizedBox(height: 20.0),
            const Text('Update Email'),
            TextFormField(
              controller: _emailController,
            ),
            const SizedBox(height: 20.0),
            FilledButton(
              onPressed: () async {
                // TODO: validate email format
                if (user.displayName != _nameController.text) {
                  user.displayName = _nameController.text;
                }

                if (user.email != _emailController.text) {
                  user.email = _emailController.text;
                  final firebaseUser = FirebaseAuth.instance.currentUser;
                  try {
                    await firebaseUser
                        ?.verifyBeforeUpdateEmail(_emailController.text);
                  } on FirebaseAuthException catch (e) {
                    // TODO: reauthenticate
                    log('User needs to reauthenticate to change email',
                        stackTrace: e.stackTrace);
                  }
                }

                di<SettingsController>().insertUserIntoDb(user);
                if (context.mounted) {
                  context.pop(true);
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
