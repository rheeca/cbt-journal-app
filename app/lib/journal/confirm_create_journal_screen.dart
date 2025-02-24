import 'package:flutter/material.dart';

class ConfirmCreateJournalScreen extends StatefulWidget {
  const ConfirmCreateJournalScreen({super.key});

  @override
  State<ConfirmCreateJournalScreen> createState() =>
      _ConfirmCreateJournalScreenState();
}

class _ConfirmCreateJournalScreenState
    extends State<ConfirmCreateJournalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Journal created!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 36.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
