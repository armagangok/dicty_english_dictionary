import 'package:flutter/material.dart';

import '../../global/export/export.dart';

class ThemeServiceImp extends ThemeService {
  static final instance = ThemeServiceImp._();
  ThemeServiceImp._() {
    _hiveHelper = getIt.call<HiveHelper>();
  }

  final _themeBox = HiveKeys.themeBox;

  late final HiveHelper _hiveHelper;

  @override
  ThemeMode get getThemeMode {
    return _isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  bool get _isDarkMode {
    var response = _hiveHelper.getData<bool>(
      _themeBox,
      _themeBox,
    );

    return response!;
  }

  @override
  Future<void> saveThemeMode(bool isDarkMode) async {
    await _hiveHelper.putData<bool>(
      _themeBox,
      _themeBox,
      isDarkMode,
    );
  }

  @override
  Future<void> initTheme() async {
    var response = _hiveHelper.getData<bool>(
      _themeBox,
      _themeBox,
    );
    if (response == null) {
      await _hiveHelper.putData<bool>(
        _themeBox,
        _themeBox,
        false,
      );
    }
  }

  @override
  bool get isDarkMode {
    var response = _hiveHelper.getData<bool>(
      _themeBox,
      _themeBox,
    );
    return response!;
  }
}
