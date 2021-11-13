import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordmind/app/views/view_home/components/buttons/language_drowdown_button.dart';
import 'package:wordmind/theme/theme_service.dart';

import './widgets/appBar_widget.dart';

class SettingView extends StatefulWidget {
  String countryLanguage;

  SettingView({Key? key, required this.countryLanguage}) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              dropDownPart(),
              Divider(),
              themeWidget(),
              Divider(),
              Container(
                color: Colors.grey,
                height: 100,
                child: Center(
                  child: Text("Advertise Zone"),
                ),
              ),
              Divider(),
              Container(
                color: Colors.grey,
                height: 100,
                child: Center(
                  child: Text("Advertise Zone"),
                ),
              ),
              Divider(),
              Container(
                color: Colors.grey,
                height: 100,
                child: Center(
                  child: Text("Advertise Zone"),
                ),
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
