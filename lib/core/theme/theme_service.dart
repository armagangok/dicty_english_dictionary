import 'package:flutter/material.dart';



import '../../feature/export/export.dart';

class ThemeService {
  final _getStorage = GetStorage();
  final String storageKey = "isDarkMode";

  ThemeMode getThemeMode() =>
      isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;

  bool isSavedDarkMode() => _getStorage.read(storageKey) ?? false;

  void saveThemeMode(bool isDarkMode) =>
      _getStorage.write(storageKey, isDarkMode);

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }
}
