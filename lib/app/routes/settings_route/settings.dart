import 'package:flutter/material.dart';
import 'package:wordmind/app/database/hive.dart';
import 'package:wordmind/app/routes/settings_route/widgets/language_drowdown_button.dart';
import 'package:numberpicker/numberpicker.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String countryLang = 'English-UK';
  int currentValue = 15;

  @override
  void initState() {
    super.initState();
    getTime().then((value) {
      print(value);
      currentValue = value;
    });
  }

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
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
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
                      countryLang = newValue!;
                    });
                  },
                  languageDropdownValue: countryLang,
                )
              ],
            ),
            const Divider(
              height: 50,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            dropDownTimeWidgetSec(),
            Divider(
              height: 50,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            ElevatedButton(
              onPressed: () {
                saveTime(currentValue);
                saveLanguage(countryLang);
              },
              child: const Text("Save Settings"),
            ),
          ],
        ),
      ),
    );
  }

  Row dropDownTimeWidgetSec() {
    return Row(
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
            value: currentValue,
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
                currentValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
