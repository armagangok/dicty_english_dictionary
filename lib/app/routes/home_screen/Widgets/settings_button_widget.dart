import 'package:flutter/material.dart';
import 'package:wordmind/app/database/hive.dart';
import 'package:wordmind/app/routes/settings_route/settings.dart';

Widget settingsButton(context) {
  return TextButton.icon(
    onPressed: () async {
      String lang = await getLanguage();
      int time = await getTime();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Setting(
              currentTime: time,
              countryLanguage: lang,
            );
          },
        ),
      );
    },
    icon: icon(),
    label: text(),
  );
}

Widget icon() {
  return Icon(
    Icons.settings,
    color: Colors.amber[900],
    size: 35,
  );
}

Widget text() {
  return Text(
    "Settings",
    style: TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontWeight: FontWeight.w800,
    ),
  );
}
