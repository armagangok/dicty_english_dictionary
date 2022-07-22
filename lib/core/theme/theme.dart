import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  final ligthTheme =
      ThemeData.from(colorScheme: const ColorScheme.light()).copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(),
      ),
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
    shadowColor: const Color.fromARGB(255, 0, 0, 0),
    dividerColor: Colors.black,
    dividerTheme: const DividerThemeData(thickness: 0.2),
    scaffoldBackgroundColor: const Color.fromARGB(255, 214, 214, 214),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        pickerTextStyle: TextStyle(color: Colors.black),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      // titleTextStyle: TextStyle(
      //   color: Colors.white,
      // ),
    ),
  );

  final darkTheme =
      ThemeData.from(colorScheme: const ColorScheme.dark()).copyWith(
    splashColor: Colors.transparent,
    dividerColor: Colors.white,
    dividerTheme: const DividerThemeData(thickness: 0.2),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(fontSize: 14),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        pickerTextStyle: TextStyle(color: Colors.white),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Color.fromARGB(255, 217, 217, 217),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      // titleTextStyle: TextStyle(
      //   color: Colors.white,
      // ),
    ),
  );
}

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
