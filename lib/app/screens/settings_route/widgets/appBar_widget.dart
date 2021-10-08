import 'package:flutter/material.dart';
import './save_button.dart';

PreferredSizeWidget appBar(currentTime, countryLanguage) {
  return AppBar(
    backgroundColor: Colors.grey[600],
    title: Text(
      "Settings",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w900,
      ),
    ),
    actions: [
      saveLanguageTimeButton(currentTime, countryLanguage),
    ],
  );
}
