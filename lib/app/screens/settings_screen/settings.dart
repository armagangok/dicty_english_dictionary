import 'package:flutter/material.dart';

import './widgets/appBar_widget.dart';
import './widgets/language_drowdown_button.dart';

class Setting extends StatefulWidget {
  late String countryLanguage;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            dropDownPart(),
          ],
        ),
      ),
    );
  }

  Widget dropDownPart() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 200,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Speaker Language:",
                  style: TextStyle(fontSize: 18),
                ),
                LanguageDropDown(
                  onChanged: (String? newValue) {
                    setState(() {
                      widget.countryLanguage = newValue!;
                    });
                  },
                  languageDropdownValue: widget.countryLanguage,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
