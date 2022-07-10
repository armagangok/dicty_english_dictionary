import 'package:flutter/material.dart';

import './components/accent_picker_widget.dart';
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
            const ThemePickerWidget(),
            const Divider(),
            AccentPickerWidget(),
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
