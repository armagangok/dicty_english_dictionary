import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordmind/app/database/hive.dart';
import 'package:wordmind/app/routes/settings_route/settings.dart';
import 'widgets.dart';

Widget settingsButton(context) {
  return TextButton.icon(
    onPressed: () async {
      String lang = await getLanguage();
      int time = await getTime();
      Get.to(() => Setting(currentTime: time, countryLanguage: lang));
    },
    icon: iconButton(Icon(Icons.settings)),
    label: text("Settings"),
  );
}
