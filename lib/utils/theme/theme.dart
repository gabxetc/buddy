import 'package:buddy_application/utils/theme/custom_themes/appbar_theme.dart';
import 'package:buddy_application/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:buddy_application/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:buddy_application/utils/theme/custom_themes/text_field_theme.dart';
import 'package:buddy_application/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// This class contains the specifications of the dark and light themes

class BAppTheme {
  BAppTheme._(); // private constructor so that the name isn't used again

  final TextStyle inter = GoogleFonts.inter();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      brightness: Brightness.light,
      primaryColor: const Color.fromRGBO(117, 169, 85, 1.0),
      scaffoldBackgroundColor: const Color.fromRGBO(117, 169, 85, 1.0),
      textTheme: BTextTheme.lightTextTheme,
      appBarTheme: BAppBarTheme.lightAppBarTheme,
      elevatedButtonTheme: BElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: BTextFormFieldTheme.lightInputDecorationTheme,
      outlinedButtonTheme: BOutlineButtonTheme.lightOutlinedButtonTheme,
      
  );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      brightness: Brightness.dark,
      primaryColor: const Color.fromRGBO(117, 169, 85, 1.0),
      scaffoldBackgroundColor: const Color.fromRGBO(37, 38, 37, 1),
      textTheme: BTextTheme.darkTextTheme,
      appBarTheme: BAppBarTheme.darkAppBarTheme,
      elevatedButtonTheme: BElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: BTextFormFieldTheme.darkInputDecorationTheme,
      outlinedButtonTheme: BOutlineButtonTheme.darkOutlinedButtonTheme,
      );
}
