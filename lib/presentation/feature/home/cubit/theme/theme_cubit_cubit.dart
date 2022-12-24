import 'package:flutter/material.dart';

import '../../../../../global/export/export.dart';

part 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  final _themeService = getIt.call<ThemeService>();

  bool get isDarkMode => _themeService.isDarkMode;

  ThemeMode get getThemeMode => _themeService.getThemeMode;

  Future<void> saveThemeMode(bool isDarkMode) async {
    await _themeService.saveThemeMode(isDarkMode);
    emit(ThemeChanged());
  }
}
