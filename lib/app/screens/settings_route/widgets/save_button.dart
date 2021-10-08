import 'package:flutter/material.dart';
import 'package:wordmind/app/database/hive.dart';

var helper = HiveHelper();

Widget saveLanguageTimeButton(currentTime, countryLanguage) {
  return IconButton(
    icon: Icon(
      Icons.save,
    ),
    onPressed: () {
      helper.saveTime(currentTime);
      helper.saveLanguage(countryLanguage);
    },
  );
}
