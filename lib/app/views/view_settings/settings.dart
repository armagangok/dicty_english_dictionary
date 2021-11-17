import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordmind/advertisement/ad_helper.dart';
import 'package:wordmind/advertisement/init_add.dart';
import 'package:wordmind/app/views/view_home/components/buttons/language_drowdown_button.dart';
import 'package:wordmind/app/views/view_settings/widgets/appBar_widget.dart';
import 'package:wordmind/theme/theme_service.dart';

class SettingView extends StatefulWidget {
  String countryLanguage;

  SettingView({
    Key? key,
    required this.countryLanguage,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 80,
                    child: Center(
                      child: addTool.checkForAd(initAd.isLoaded3, initAd.ad3),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 80,
                    child: Center(
                      child: addTool.checkForAd(initAd.isLoaded4, initAd.ad4),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 80,
                    child: Center(
                      child: addTool.checkForAd(initAd.isLoaded5, initAd.ad5),
                    ),
                  ),
                  SizedBox(height: 15),
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
