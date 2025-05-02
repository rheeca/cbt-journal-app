import 'package:animated_checkmark/animated_checkmark.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmCreateJournalScreen extends StatefulWidget {
  const ConfirmCreateJournalScreen({super.key});

  @override
  State<ConfirmCreateJournalScreen> createState() =>
      _ConfirmCreateJournalScreenState();
}

class _ConfirmCreateJournalScreenState
    extends State<ConfirmCreateJournalScreen> {
  bool _checked = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      setState(() => _checked = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkmark(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
              checked: _checked,
              indeterminate: false,
              size: 60,
              weight: 10,
              color: Theme.of(context).primaryColor,
              drawDash: false,
            ),
            const SizedBox(height: 24),
            Text(
              'Journal created!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 36.0,
            ),
            FilledButton(
              onPressed: () {
                if (context.mounted) context.pop();
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
