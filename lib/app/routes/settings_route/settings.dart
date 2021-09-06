import 'package:flutter/material.dart';
import 'package:wordmind/app/database/hive.dart';
import 'package:wordmind/app/routes/settings_route/widgets/language_drowdown_button.dart';
import 'package:numberpicker/numberpicker.dart';

// ignore: must_be_immutable
class Setting extends StatefulWidget {
  String countryLanguage = 'English-UK';
  int currentValue = 15;
  Setting({
    Key? key,
    required this.currentValue,
    required this.countryLanguage,
  }) : super(key: key);
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Divider(height: 50, thickness: 1, indent: 0, endIndent: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Choose language",
                  style: TextStyle(fontSize: 20),
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
            const Divider(height: 50, thickness: 1, indent: 0, endIndent: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Loop time",
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: NumberPicker(
                    textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    value: widget.currentValue,
                    axis: Axis.horizontal,
                    minValue: 10,
                    maxValue: 40,
                    step: 1,
                    haptics: true,
                    itemHeight: 50,
                    itemWidth: 35,
                    selectedTextStyle: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                    itemCount: 5,
                    onChanged: (value) async {
                      setState(() {
                        widget.currentValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Divider(height: 50, thickness: 1, indent: 0, endIndent: 0),
            ElevatedButton(
              onPressed: () {
                saveTime(widget.currentValue);
                saveLanguage(widget.countryLanguage);
              },
              child: const Text("Save Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
