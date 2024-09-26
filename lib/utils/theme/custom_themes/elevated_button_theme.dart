import 'package:flutter/material.dart';

// This class contains the specifications of the dark and light elevated button themes

class BElevatedButtonTheme {
  BElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: const Color.fromRGBO(117, 169, 85, 1.0),
      disabledBackgroundColor: const Color.fromRGBO(64, 95, 44, 1),
      disabledForegroundColor: const Color.fromRGBO(64, 95, 44, 1),
      padding: const EdgeInsets.symmetric(vertical: 10),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: const Color.fromRGBO(117, 169, 85, 1.0),
      disabledBackgroundColor: const Color.fromRGBO(64, 95, 44, 1),
      disabledForegroundColor: const Color.fromRGBO(64, 95, 44, 1),
      padding: const EdgeInsets.symmetric(vertical: 10),
      textStyle: const TextStyle(fontSize: 16, color: Colors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
