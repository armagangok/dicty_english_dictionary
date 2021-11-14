import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wordmind/app/screens/view_settings/settings.dart';
import 'package:wordmind/database/hive_helper.dart';

class AddWordButtonWidget extends StatelessWidget {
  final BannerAd? ad3;
  final BannerAd? ad4;
  final bool? isLoaded3;
  final bool? isLoaded4;

  const AddWordButtonWidget(
      {Key? key, this.ad3, this.ad4, this.isLoaded3, this.isLoaded4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        String lang = await hiveHelper.getLanguage();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingView(
              countryLanguage: lang,
              ad3: ad3,
              isLoaded3: isLoaded3,
              isLoaded4: isLoaded4,
              ad4: ad4,
            ),
          ),
        );
      },
      icon: Icon(Icons.add_circle, size: 30),
    );
  }
}
