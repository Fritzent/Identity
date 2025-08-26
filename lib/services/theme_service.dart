import 'package:flutter/material.dart';

class ThemeService {
  static bool getThemeMode(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return isDark;
  }
}