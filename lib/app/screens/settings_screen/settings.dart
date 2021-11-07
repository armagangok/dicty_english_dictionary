import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordmind/theme/theme_service.dart';
import './widgets/appBar_widget.dart';
import '../home_screen/components/buttons/language_drowdown_button.dart';

class Setting extends StatefulWidget {
  String countryLanguage;

  Setting({Key? key, required this.countryLanguage}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
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
