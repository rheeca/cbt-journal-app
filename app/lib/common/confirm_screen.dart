import 'package:animated_checkmark/animated_checkmark.dart';
import 'package:cbt_journal/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({
    super.key,
    required this.future,
    this.loadingMessage,
    this.completedMessage,
    this.buttonText,
  });
  final Future<void> future;
  final String? loadingMessage;
  final String? completedMessage;
  final String? buttonText;

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: widget.future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 24),
                  Text(
                    widget.loadingMessage ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            );
          } else {
            return _ConfirmMessage(
              message: widget.completedMessage,
              buttonText: widget.buttonText,
            );
          }
        },
      ),
      backgroundColor: AppColor.lightYellow.color,
    );
  }
}

class _ConfirmMessage extends StatefulWidget {
  const _ConfirmMessage({this.message, this.buttonText});
  final String? message;
  final String? buttonText;

  @override
  State<_ConfirmMessage> createState() => _ConfirmMessageState();
}

class _ConfirmMessageState extends State<_ConfirmMessage> {
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
    return Center(
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
            widget.message ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 36.0,
          ),
          FilledButton(
            onPressed: () {
              if (context.mounted) context.pop();
            },
            child: Text(widget.buttonText ?? 'Confirm'),
          ),
        ],
      ),
    );
  }
}
