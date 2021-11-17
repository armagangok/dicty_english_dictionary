import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordmind/app/views/view_settings/settings.dart';
import 'package:wordmind/database/hive_helper.dart';

class SettingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        String lang = await hiveHelper.getLanguage();
        print(lang.runtimeType);
        Get.to(() => SettingView(countryLanguage: lang));
      },
      icon: Icon(Icons.settings),
    );
  }
}
