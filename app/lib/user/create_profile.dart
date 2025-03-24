import 'package:cbt_journal/home/home_controller.dart';
import 'package:cbt_journal/models/model.dart';
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
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    di<HomeController>().createProfile(
                      UserModel(
                        userId: firebaseUser.uid,
                        email: firebaseUser.email ?? '',
                        displayName: controller.text,
                        createdAt: DateTime.now(),
                      ),
                    );
                  }
                },
                child: const Text('Save'),
              ),
              const SizedBox(height: 150.0),
            ],
          ),
        ),
      ),
    );
  }
}
