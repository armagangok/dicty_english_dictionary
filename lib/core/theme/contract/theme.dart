import 'package:flutter/material.dart';

abstract class ThemeService {
  bool get isDarkMode;

  Future<void> saveThemeMode(bool isDarkMode);

  ThemeMode get getThemeMode;
  Future<void> initTheme();
}
