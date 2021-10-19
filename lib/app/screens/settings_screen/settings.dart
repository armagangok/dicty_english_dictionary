import 'package:flutter/material.dart';
import './widgets/appBar_widget.dart';
import './widgets/language_drowdown_button.dart';

class Setting extends StatefulWidget {
  late final String countryLanguage;

  Setting({
    Key? key,
    required this.countryLanguage,
  }) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.countryLanguage),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(top: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              dropDownPart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDownPart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LanguageDropDown(
          onChanged: (String? newValue) {
            setState(() {
              widget.countryLanguage = newValue!;
            });
          },
          languageDropdownValue: widget.countryLanguage,
        )
      ],
    );
  }
}
