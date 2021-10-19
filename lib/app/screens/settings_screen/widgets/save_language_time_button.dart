import 'package:flutter/material.dart';
import 'package:wordmind/database/hive_helper.dart';

Widget saveLanguageTimeButton(countryLanguage) {
  return IconButton(
    icon: Icon(
      Icons.save,
    ),
    onPressed: () {
      hiveHelper.saveLanguage(countryLanguage);
    },
  );
}
