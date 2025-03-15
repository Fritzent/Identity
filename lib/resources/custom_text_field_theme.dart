import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:identity/resources/colors.dart';

class CustomTextFieldTheme {
  CustomTextFieldTheme._();

  static InputDecorationTheme lightTextFieldThemeMode = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ColorList.generalGray100AppFonts,
    suffixIconColor: ColorList.generalGray100AppFonts,
    hintStyle: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: ColorList.generalWhite100AppFonts
    ),
    errorStyle: GoogleFonts.nunito(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.red
    ),
    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: ColorList.generalWhite100AppFonts),
    ),
    focusedBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: ColorList.generalBlueAppFonts),
    ),
    errorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),
  );

  static InputDecorationTheme darkTextFieldThemeMode = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ColorList.generalGray100AppFonts,
    suffixIconColor: ColorList.generalGray100AppFonts,
    hintStyle: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: ColorList.generalWhite100AppFonts
    ),
    errorStyle: GoogleFonts.nunito(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.red
    ),
    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: ColorList.generalWhite100AppFonts),
    ),
    focusedBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: ColorList.generalBlueAppFonts),
    ),
    errorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),
  );

}
