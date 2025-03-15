import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:identity/resources/colors.dart';

class CustomTextTheme {
  CustomTextTheme._();

  static TextTheme lightTextThemeMode = GoogleFonts.nunitoTextTheme().copyWith(
    titleLarge: GoogleFonts.nunito(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: ColorList.lightModeAppFonts,
    ),
    titleMedium: GoogleFonts.nunito(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorList.lightModeAppFonts,
    ),
    bodyLarge: GoogleFonts.nunito(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: ColorList.generalGray100AppFonts,
    ),
    bodyMedium: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: ColorList.generalGrayAppFonts,
    ),
    bodySmall: GoogleFonts.nunito(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: ColorList.lightModeAppFonts,
    ),
    displayLarge: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: ColorList.generalGray100AppFonts,
    ),
    displayMedium: GoogleFonts.nunito(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: ColorList.lightModeAppFonts,
    ),
    displaySmall: GoogleFonts.nunito(
      fontSize: 11,
      fontWeight: FontWeight.normal,
      color: ColorList.generalWhiteAppFonts,
    ),
    labelMedium: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ColorList.generalGray100AppFonts,
    ),
    labelSmall: GoogleFonts.nunito(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: ColorList.generalGray100AppFonts,
    ),
  );
  static TextTheme darkTextThemeMode = GoogleFonts.nunitoTextTheme().copyWith(
    titleLarge: GoogleFonts.nunito(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: ColorList.darkModeAppFonts,
    ),
    titleMedium: GoogleFonts.nunito(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorList.darkModeAppFonts,
    ),
    bodyLarge: GoogleFonts.nunito(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: ColorList.generalGrayAppFonts,
    ),
    bodyMedium: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: ColorList.generalGrayAppFonts,
    ),
    bodySmall: GoogleFonts.nunito(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: ColorList.darkModeAppFonts,
    ),
    displayLarge: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: ColorList.generalGray100AppFonts,
    ),
    displayMedium: GoogleFonts.nunito(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: ColorList.lightModeAppFonts,
    ),
    displaySmall: GoogleFonts.nunito(
      fontSize: 11,
      fontWeight: FontWeight.normal,
      color: ColorList.generalWhiteAppFonts,
    ),
    labelMedium: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ColorList.generalGrayAppFonts,
    ),
    labelSmall: GoogleFonts.nunito(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: ColorList.generalGray100AppFonts,
    ),
  );
}
