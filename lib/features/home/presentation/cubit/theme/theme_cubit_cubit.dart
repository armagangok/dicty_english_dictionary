import '../../../../../global/injection.dart';
import 'package:flutter/material.dart';

import '../../../../../global/export/export.dart';

part 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool get isDarkMode => themeService.isDarkMode;

  ThemeMode get getThemeMode => themeService.getThemeMode;

  Future<void> saveThemeMode(bool isDarkMode) async {
    await themeService.saveThemeMode(isDarkMode);
    emit(ThemeChanged());
  }
}
