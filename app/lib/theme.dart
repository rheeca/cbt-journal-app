import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueGrey,
  ),
  textTheme: const TextTheme(
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ),
);
