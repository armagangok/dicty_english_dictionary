import 'package:flutter/material.dart';

import './components/accent_picker_widget.dart';
import './components/theme_picker_widget.dart';
import '../../../core/remote/admob/ad_helper.dart';
import '../../../core/remote/admob/generate_ad.dart';
import '../../core/extension/context_extension.dart';
import '../../feature/components/ad_widget.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AdvertisementWidget(
        unitID: AdHelper.bannerAdUnitId2,
        ad: generateAd.ad,
      ),
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: context.width(0.05)),
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          const ThemePickerWidget(),
          const Divider(),
          AccentPickerWidget(),
        ],
      ),
    );
  }
}
