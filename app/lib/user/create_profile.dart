import 'package:cbt_journal/generated/user.pb.dart' as pb_user;
import 'package:cbt_journal/home/home_controller.dart';
import 'package:cbt_journal/theme.dart';
import 'package:cbt_journal/util/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Card(
            color: AppColor.lightYellow.color,
            child: Container(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('What is your name?'),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: controller,
                    autofocus: true,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  FilledButton(
                    onPressed: () {
                      final firebaseUser = FirebaseAuth.instance.currentUser;
                      if (firebaseUser != null) {
                        final now = DateTime.now().toUtc();
                        di<HomeController>().createProfile(
                          pb_user.User(
                            id: firebaseUser.uid,
                            email: firebaseUser.email ?? '',
                            displayName: controller.text,
                            createdAt: now.toProtoTimestamp(),
                            updatedAt: now.toProtoTimestamp(),
                            isDeleted: false,
                          ),
                        );
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 70),
      ],
    );
  }
}
