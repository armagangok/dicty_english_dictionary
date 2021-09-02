import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LanguageDropDown extends StatelessWidget {
  LanguageDropDown(
      {Key? key, required this.onChanged, required this.languageDropdownValue})
      : super(key: key);

  Function(String? lang) onChanged;
  String languageDropdownValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        dropdownColor: Colors.grey[300],
        value: languageDropdownValue,
        style: TextStyle(color: Colors.blue[500]),
        onChanged: onChanged,
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
    );
  }
}
