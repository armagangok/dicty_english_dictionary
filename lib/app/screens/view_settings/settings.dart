import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:wordmind/advertisement/ad_helper.dart';
import 'package:wordmind/app/views/view_home/components/buttons/language_drowdown_button.dart';
import 'package:wordmind/app/views/view_settings/widgets/appBar_widget.dart';
import 'package:wordmind/theme/theme_service.dart';

class SettingView extends StatefulWidget {
  String countryLanguage;

  final BannerAd? ad3;
  final BannerAd? ad4;
  final bool? isLoaded3;
  final bool? isLoaded4;


  SettingView({
    Key? key,
    required this.countryLanguage,
    required this.ad3,
    required this.ad4,
    required this.isLoaded3,
    required this.isLoaded4,
  }) : super(key: key);

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  var _switchValue = ThemeService().isSavedDarkMode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.countryLanguage),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              color: Colors.grey,
              child: Center(
                child: addTool.checkForAd(widget.isLoaded4, widget.ad4),
              ),
            ),
            Divider(),
            dropDownPart(),
            Divider(),
            themeWidget(),
            Divider(),
            Container(
              height: 60,
              child: Center(
                child: addTool.checkForAd(widget.isLoaded3, widget.ad3),
              ),
            ),
            Divider(),
          ],
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
        Text("Speaker Language"),
        LanguageDropDown(
          onChanged: (String? newValue) {
            setState(() {
              widget.countryLanguage = newValue!;
            });
          },
          dropdownValue: widget.countryLanguage,
        )
      ],
    );
  }
}
