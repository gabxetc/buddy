import 'package:flutter/material.dart';

// This class contains the specifications of the dark and light text theme themes

class BTextTheme {
  BTextTheme._(); //constructor

  static TextTheme lightTextTheme = TextTheme(
    titleLarge: const TextStyle().copyWith(fontSize: 50, color: Colors.black),
    headlineLarge:
        const TextStyle().copyWith(fontSize: 32, color: Colors.black),
    headlineMedium:
        const TextStyle().copyWith(fontSize: 25, color: Colors.black),
    headlineSmall:
        const TextStyle().copyWith(fontSize: 18, color: Colors.black),
    bodyMedium: const TextStyle().copyWith(fontSize: 12, color: Colors.black),
    bodySmall: const TextStyle().copyWith(fontSize: 8, color: Colors.black),
  );

  static TextTheme darkTextTheme = TextTheme(
    titleLarge: const TextStyle().copyWith(fontSize: 50, color: Colors.white),
    headlineLarge:
        const TextStyle().copyWith(fontSize: 32, color: Colors.white),
    headlineMedium:
        const TextStyle().copyWith(fontSize: 25, color: Colors.white),
    headlineSmall:
        const TextStyle().copyWith(fontSize: 18, color: Colors.white),
    bodyMedium: const TextStyle().copyWith(fontSize: 12, color: Colors.white),
    bodySmall: const TextStyle().copyWith(fontSize: 8, color: Colors.white),
  );
}
