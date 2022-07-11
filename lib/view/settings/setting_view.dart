import 'dart:ui';

import 'package:flutter/material.dart';

import './components/accent_picker_widget.dart';
import './components/setting_item.dart';
import './components/theme_picker_widget.dart';
import '../../feature/export/export.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: AdvertisementWidget(
      //   unitID: AdHelper.bannerAdUnitId2,
      //   ad: generateAd.ad,
      // ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: context.width(0.05)),
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            SettingItem(
              text: "App Theme",
              data: "Change the theme mode of app.",
              onTap: () {
                Get.dialog(BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.9, sigmaY: 0.9),
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.width(0.05),
                        vertical: context.width(0.05),
                      ),
                      child: const ThemePickerWidget(),
                    ),
                  ),
                ));
              },
            ),
            SettingItem(
              text: "Speaker Accent",
              data: "Set up the English acceent of speaker.",
              onTap: () {
                Get.dialog(
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0.9, sigmaY: 0.9),
                    child: Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.width(0.05),
                          vertical: context.width(0.05),
                        ),
                        child: const AccentPickerWidget(),
                      ),
                    ),
                  ),
                );
              },
            ),
            // const ThemePickerWidget(),

            // AccentPickerWidget(),
          ],
        ),
      ),
    );
  }
}

// var now = DateTime.now();
// var formatter = DateFormat('yyyy-MM-dd');
// String today = formatter.format(now);

// Map<String, String> words = {
// a
// about
// act
// actually
// add
// after
// again
// against
// age
// ago
// air
// all
// also
// always
// am
// among
// an
// and
// animal
// another
// answer
// appear
// are
// area
// as
// ask
// at
// };

