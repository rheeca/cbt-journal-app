import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> showConfirmDialog(
  BuildContext context, {
  required void Function() onConfirm,
  String? title,
  String? confirmText,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title ?? ''),
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
          FilledButton(
            style: FilledButton.styleFrom(
                textStyle: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.white),
                backgroundColor: Colors.red.shade900),
            onPressed: onConfirm,
            child: Text(confirmText ?? 'Confirm'),
          ),
        ],
      );
    },
  );
}
