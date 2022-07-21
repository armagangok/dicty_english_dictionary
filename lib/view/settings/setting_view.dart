import 'dart:ui';

import 'package:flutter/material.dart';

import 'components/accent_picker_widget.dart';
import 'components/setting_item.dart';
import 'components/theme_picker_widget.dart';
import '../../feature/export/export.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // bottomNavigationBar: AdvertisementWidget(
        //   unitID: AdHelper.bannerAdUnitId2,
        //   ad: generateAd.ad,
        // ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: context.width(0.08)),
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const SizedBox001(),
              SettingItem(
                text: "App Theme",
                data: "Set the theme mode of app.",
                onTap: () => buildDialog(const ThemePickerWidget()),
              ),
              const SizedBox001(),
              SettingItem(
                text: "Speaker Accent",
                data: "Set the English accent of speaker.",
                onTap: () => buildDialog(const AccentPickerWidget()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //

  Future<dynamic> buildDialog(Widget child) {
    return Get.dialog(
      Builder(builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.9, sigmaY: 0.9),
          child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width(0.05),
                vertical: context.width(0.05),
              ),
              child: child,
            ),
          ),
        );
      }),
    );
  }
}
