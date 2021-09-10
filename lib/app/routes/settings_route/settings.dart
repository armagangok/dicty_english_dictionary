import 'package:flutter/material.dart';
import 'package:wordmind/app/database/hive.dart';
import 'package:wordmind/app/routes/settings_route/widgets/language_drowdown_button.dart';
import 'package:numberpicker/numberpicker.dart';

// ignore: must_be_immutable
class Setting extends StatefulWidget {
  String countryLanguage = "English-UK";
  int currentTime = 15;

  Setting({
    Key? key,
    required this.currentTime,
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
      appBar: appBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            dropDownPart(),
            Divider(height: 50, thickness: 1, indent: 0, endIndent: 0),
            numberPickerPart(),
            Divider(height: 50, thickness: 1, indent: 0, endIndent: 0),
            saveButton(),
            Divider(height: 50, thickness: 1, indent: 0, endIndent: 0),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.grey[500],
      title: Text(
        "Settings",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget dropDownPart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Choose language", style: TextStyle(fontSize: 20)),
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

  Widget numberPickerPart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Loop time",
          style: TextStyle(fontSize: 20),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: NumberPicker(
            textStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            value: widget.currentTime,
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
                widget.currentTime = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget saveButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[600],
      ),
      onPressed: () {
        saveTime(widget.currentTime);
        saveLanguage(widget.countryLanguage);
      },
      child: const Text(
        "Save Settings",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
