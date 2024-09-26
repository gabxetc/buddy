import 'package:flutter/material.dart';

// This class contains all the colors used in the app

class BColors {
  BColors._();

  // App Basic Colors
  static const Color primaryColor = Color(0xFF861657);
  static const Color secondaryColor = Color(0xFFFFA69E);
  static const Color accentColor = Color(0xFF93E1D8);

  // Gradient Colors
  static const Gradient linearGradientBlue = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
    Color(0xFF1D4E89),
    Color(0xFF00B2CA),
    Color(0xFF7DCFB6),
  ]);

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textwhite = Colors.white;

  // Background Colors
  static const Color light = Colors.white;
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Colors.white;

  // Background Container Colors
  static const Color lightContainer = Colors.white;
  static Color dakrContainer = BColors.white.withOpacity(0.1);

  // Button Colors
  static const Color butoonPrimary = Color(0xFFAA4465);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border Colors
  static const Color borderPrimary = Colors.white;
  static const Color borderSecondary = Color(0xFFDDFFF7);

  // Error and Validation Colors
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Colors.orange;
  static const Color info = Colors.blue;

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFFF4F4F4);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
