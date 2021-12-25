import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../core/remote/admob/ad_helper.dart';
import 'components/stacks/stacks.dart';

class SettingView extends StatelessWidget {
  final BannerAd ad2;
  final bool isLoaded2;

  const SettingView({
    Key? key,
    required this.ad2,
    required this.isLoaded2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AdHelper().checkForAd(isLoaded2, ad2),
      appBar: AppBar(title: const Text("Settings")),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const ThemePickerWidget(),
                  const Divider(),
                  AccentPickerWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
