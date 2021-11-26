import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordmind/app/views/view_home/components/buttons/language_drowdown_button.dart';
import 'package:wordmind/app/views/view_settings/widgets/appBar_widget.dart';
import 'package:wordmind/theme/theme_service.dart';

class SettingView extends StatefulWidget {
  String accent;

  SettingView({
    Key? key,
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
      appBar: appBar(widget.accent),
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
          onChanged: (String? newValue) {
            setState(() {
              widget.accent = newValue!;
            });
          },
          dropdownValue: widget.accent,
        )
      ],
    );
  }
}
