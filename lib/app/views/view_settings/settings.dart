import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wordmind/ads/ad_helper.dart';

import 'package:wordmind/app/components/common/buttons.dart';
import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/theme/theme_service.dart';

class SettingView extends StatefulWidget {
  String accent;
  final BannerAd bottomBanner;
  final bool isLoaded;

  SettingView({
    Key? key,
    required this.bottomBanner,
    required this.isLoaded,
    required this.accent,
  }) : super(key: key);

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  var _switchValue = ThemeService().isSavedDarkMode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          AdHelper().checkForAd(widget.isLoaded, widget.bottomBanner) ??
              Text("Advertisement could not show up."),
      appBar: AppBar(title: Text("Settings")),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  dropDownPart(),
                  Divider(),
                  themeWidget(),
                  Divider(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget themeWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Dark Mode"),
        CupertinoSwitch(
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
              ThemeService().changeTheme();
            });
          },
        ),
      ],
    );
  }

  Widget dropDownPart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("English Accent"),
        LanguageDropDown(
          onChanged: (String? newValue) async {
            setState(() {
              widget.accent = newValue!;
            });
            await hiveHelper.saveLanguage(widget.accent);
            print(widget.accent);
          },
          dropdownValue: widget.accent,
        )
      ],
    );
  }
}
