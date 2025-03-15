import 'package:flutter/material.dart';
import 'package:identity/resources/colors.dart';
import 'package:identity/resources/custom_text_field_theme.dart';
import 'package:identity/resources/custom_text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: ColorList.lightModeBackground,
    primaryColorLight: ColorList.lightModeBackground,
    primaryColor: ColorList.lightModeAppFonts,
    textTheme: CustomTextTheme.lightTextThemeMode,
    inputDecorationTheme: CustomTextFieldTheme.lightTextFieldThemeMode,
  );

  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: ColorList.darkModeBackground,
    primaryColorDark: ColorList.darkModeBackground,
    primaryColor: ColorList.darkModeAppFonts,
    textTheme: CustomTextTheme.darkTextThemeMode,
    inputDecorationTheme: CustomTextFieldTheme.darkTextFieldThemeMode,
  );
}