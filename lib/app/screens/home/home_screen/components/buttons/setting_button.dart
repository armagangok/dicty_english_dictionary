import 'package:flutter/material.dart';
import 'package:wordmind/app/core/navigation/get_to_screen.dart';
import 'package:wordmind/app/screens/settings_screen/settings.dart';
import 'package:wordmind/database/hive_helper.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        String lang = await hiveHelper.getLanguage();
        navigation.getTo(Setting(countryLanguage: lang));
      },
      icon: Icon(Icons.settings),
    );
  }
}
