import 'package:flutter/material.dart';
import 'package:wordmind/app/database/hive.dart';
import 'package:wordmind/app/screens/settings_route/settings.dart';
import 'widgets.dart';

var helper = HiveHelper();

Widget settingsButton(context) {
  return TextButton.icon(
    onPressed: () async {
      String lang = await helper.getLanguage();
      int time = await helper.getTime();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Setting(
            currentTime: time,
            countryLanguage: lang,
          ),
        ),
      );
    },
    icon: iconButton(Icon(Icons.settings)),
    label: text("Settings"),
  );
}
