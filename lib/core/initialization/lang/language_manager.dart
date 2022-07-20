import 'package:flutter/material.dart';

class LanguageManager {
  LanguageManager._();
  static final instance = LanguageManager._();
  final enLocale = const Locale("en");

  List<Locale> get supportedLocales => [enLocale];
}
