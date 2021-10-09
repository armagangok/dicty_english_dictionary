import 'package:flutter/material.dart';
import 'package:wordmind/database/hive_helper_object.dart';


Widget saveLanguageTimeButton(currentTime, countryLanguage) {
  return IconButton(
    icon: Icon(
      Icons.save,
    ),
    onPressed: () {
      hiveHelper.saveTime(currentTime);
      hiveHelper.saveLanguage(countryLanguage);
    },
  );
}
