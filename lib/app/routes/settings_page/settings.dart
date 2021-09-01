import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/settings_page/numberpicker_widget.dart';
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
                Center(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.grey[300],
                    value: dropdownValue,
                    style: TextStyle(color: Colors.blue[500]),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      'English-UK',
                      'English-US',
                      'English-IN',
                      'Turkish',
                      'Deutch',
                      'French',
                      'Arabic',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
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
