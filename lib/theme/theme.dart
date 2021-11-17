import 'package:flutter/material.dart';

class CustomTheme {
  final ligthTheme =
      ThemeData.from(colorScheme: const ColorScheme.light()).copyWith(
    // textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
    // scaffoldBackgroundColor: Colors.blue[100],
    // cardColor: Colors.orange[100],
    // dividerColor: Colors.black,
    // dividerTheme: DividerThemeData(thickness: 0.2),
    // textButtonTheme: TextButtonThemeData(
    //   style: ButtonStyle(
    //       // backgroundColor: MaterialStateProperty.all<Color>(Colors.orange[200]!),
    //       // foregroundColor: MaterialStateProperty.all<Color>(Colors.red[600]!),
    //       ),
    // ),
    // iconTheme: IconThemeData(color: Colors.purple),

    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(90.0),
        borderSide: BorderSide(
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(90.0),
        borderSide: BorderSide(),
      ),
      filled: true,
      fillColor: Colors.grey[300],
      labelStyle: TextStyle(color: Colors.black),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
    cardColor: Colors.grey[300],
    dividerColor: Colors.black,
    dividerTheme: DividerThemeData(thickness: 0.2),
    scaffoldBackgroundColor: Colors.grey[100],
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
    ),
  );

  final darkTheme =
      ThemeData.from(colorScheme: const ColorScheme.dark()).copyWith(
    dividerColor: Colors.white,
    dividerTheme: DividerThemeData(thickness: 0.2),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 14),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(90.0),
        borderSide: BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(90.0),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
    ),
  );
}
