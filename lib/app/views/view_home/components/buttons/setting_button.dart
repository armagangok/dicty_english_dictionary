import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:wordmind/app/screens/view_settings/settings.dart';
import 'package:wordmind/database/hive_helper.dart';

class SettingButton extends StatelessWidget {
  
  final bool? isLoaded3;
  final bool? isLoaded4;
  final BannerAd? ad3;
  final BannerAd? ad4;

  const SettingButton({
    Key? key,
    required this.ad3,
    required this.isLoaded3,
    required this.isLoaded4,
    required this.ad4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        String lang = await hiveHelper.getLanguage();
        print(lang.runtimeType);
        Get.to(() => SettingView(
              countryLanguage: lang,
              ad3: ad3,
              ad4: ad4,
              isLoaded3: isLoaded3,
              isLoaded4: isLoaded4,
            ));
      },
      icon: Icon(Icons.settings),
    );
  }
}
