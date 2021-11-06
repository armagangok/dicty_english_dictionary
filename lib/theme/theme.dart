import 'package:flutter/material.dart';

class CustomTheme {
  final lightTheme = ThemeData.light().copyWith(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.blue[100],
    cardColor: Colors.orange[100],
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        // backgroundColor: MaterialStateProperty.all<Color>(Colors.orange[200]!),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.orange[100],
      labelStyle: TextStyle(
        color: Colors.black,
      ),
    ),
  );
  final darkTheme = ThemeData.from(colorScheme: const ColorScheme.dark());
}
