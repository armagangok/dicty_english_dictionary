import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:english_accent_dictionary/admob/ad_helper.dart';
import 'package:english_accent_dictionary/app/global/components/common/buttons.dart';
import 'package:english_accent_dictionary/app/theme/theme_service.dart';
import 'package:english_accent_dictionary/core/database/hive_helper.dart';

class SettingView extends StatefulWidget {
  String accent;
  final BannerAd ad2;
  final bool isLoaded2;

  SettingView({
    Key? key,
    required this.ad2,
    required this.isLoaded2,
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
      // bottomNavigationBar: AdHelper().checkForAd(widget.isLoaded2, widget.ad2),
      appBar: AppBar(title: const Text("Settings")),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  dropDownPart(),
                  const Divider(),
                  themeWidget(),
                  const Divider(),
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
        const Text("Dark Mode"),
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
        const Text("English Accent"),
        LanguageDropDown(
          onChanged: (String? newValue) async {
            setState(() {
              widget.accent = newValue!;
            });
            await hiveHelper.saveLanguage(widget.accent);
          },
          dropdownValue: widget.accent,
        )
      ],
    );
  }
}
