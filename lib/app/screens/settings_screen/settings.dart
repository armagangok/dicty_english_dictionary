import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import './widgets/appBar_widget.dart';
import './widgets/language_drowdown_button.dart';

// ignore: must_be_immutable
class Setting extends StatefulWidget {
  String countryLanguage = "English-UK";
  int currentTime;

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
      appBar: appBar(widget.currentTime, widget.countryLanguage),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(top: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              dropDownPart(),
              Divider(
                height: MediaQuery.of(context).size.height / 10,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              numberPickerPart(),
              Divider(
                height: MediaQuery.of(context).size.height / 10,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
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
              color: Colors.orange[800],
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
            itemCount: 5,
            onChanged: (value) {
              setState(() {
                print(value);
                widget.currentTime = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
