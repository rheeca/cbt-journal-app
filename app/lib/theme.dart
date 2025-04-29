import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF588C7E),
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: AppColor.lightYellow.color,
    elevation: 8.0,
    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xFF294C43),
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Color(0xFF294C43),
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFF407E6F),
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ),
);

enum AppColor {
  lightYellow(Color.fromARGB(255, 240, 236, 223)),
  white(Color.fromARGB(255, 246, 243, 233));

  const AppColor(this.color);
  final Color color;
}
