import 'package:flutter/material.dart';
import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/app/screens/settings_screen/settings.dart';
import 'widgets.dart';


Widget settingsButton(context) {
  return TextButton.icon(
    onPressed: () async {
      String lang = await hiveHelper.getLanguage();
      int time = await hiveHelper.getTime();
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
    label: text("Settings", context),
  );
}
