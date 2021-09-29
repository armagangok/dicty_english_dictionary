import 'package:flutter/material.dart';
import 'package:wordmind/app/database/hive.dart';

Widget saveButton(currentTime, countryLanguage) {
  return IconButton(
    icon: Icon(
      Icons.save,
    ),
    onPressed: () {
      saveTime(currentTime);
      saveLanguage(countryLanguage);
    },
  );
}
