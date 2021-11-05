import 'package:flutter/material.dart';
import '../../home/home_screen/components/buttons/save_language_button.dart';

PreferredSizeWidget appBar(countryLanguage) {
  return AppBar(
    title: Text(
      "Settings",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w900,
      ),
    ),
    actions: [
      saveLanguageButton(countryLanguage),
    ],
  );
}
