import 'package:flutter/material.dart';

import '../../feature/export/export.dart';

class CustomTheme {
  CustomTheme._();
  static final instance = CustomTheme._();

  final ligthTheme = ThemeData.light().copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
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
    shadowColor: const Color.fromARGB(255, 0, 0, 0),
    dividerColor: Colors.black,
    dividerTheme: const DividerThemeData(thickness: 0.2),
    scaffoldBackgroundColor: KColor.scaffoldBacground,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: Colors.white,
      textTheme: CupertinoTextThemeData(
        primaryColor: Colors.white,
        pickerTextStyle: TextStyle(color: Colors.white),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: KColor.primaryColor,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0,
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: KColor.primaryColor,
    ),
    colorScheme: const ColorScheme(
      primary: KColor.primaryColor,
      secondary: KColor.scaffoldBacground,
      surface: Color(0xffffffff),
      background: KColor.scaffoldBacground,
      error: Color(0xffd32f2f),
      onPrimary: Color(0xffffffff),
      onSecondary: Color(0xffffffff),
      onSurface: KColor.primaryColor,
      onBackground: KColor.primaryColor,
      onError: Color(0xffffffff),
      brightness: Brightness.light,
      primaryContainer: KColor.primaryColor,
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.white.withOpacity(0.2),
      cursorColor: Colors.white.withOpacity(0.4),
      selectionHandleColor: Colors.white,
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),
      primaryColor: const Color.fromARGB(255, 23, 87, 126),
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
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // titleTextStyle: TextStyle(
        //   color: Colors.white,
        // ),
      ),
      colorScheme: const ColorScheme(
        primary: Colors.white,
        secondary: Colors.white,
        surface: Color(0xffffffff),
        background: Color.fromARGB(255, 18, 18, 18),
        error: Color(0xffd32f2f),
        onPrimary: Color(0xffffffff),
        onSecondary: Color(0xffffffff),
        onSurface: Color.fromARGB(255, 101, 162, 197),
        onBackground: Color.fromARGB(255, 94, 150, 183),
        onError: Color(0xffffffff),
        brightness: Brightness.light,
        primaryContainer: Colors.black,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colors.white.withOpacity(0.2),
        cursorColor: Colors.white.withOpacity(0.4),
        selectionHandleColor: Colors.white,
      ));
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