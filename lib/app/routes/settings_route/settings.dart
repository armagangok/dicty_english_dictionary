import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/settings_route/widgets/language_drowdown_button.dart';
import 'package:wordmind/app/routes/settings_route/widgets/numberpicker_widget.dart';
import 'package:wordmind/models/tts_helper/text_to_speech_helper.dart';

class Setting extends StatefulWidget {
  Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String dropdownValue = 'English-UK';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Choose language",
                  style: TextStyle(fontSize: 20),
                ),
                LanguageDropDown(
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  languageDropdownValue: dropdownValue,
                ),
              ],
            ),
            NumberPickerWidget(),
            ElevatedButton(
              onPressed: () {
                languageController(dropdownValue);
              },
              child: Text("Save Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
