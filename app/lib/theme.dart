import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueGrey,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ),
);
