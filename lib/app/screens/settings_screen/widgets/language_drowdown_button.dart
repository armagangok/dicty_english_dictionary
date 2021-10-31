import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LanguageDropDown extends StatefulWidget {
  Function(String? lang) onChanged;
  String languageDropdownValue;
  LanguageDropDown({
    Key? key,
    required this.onChanged,
    required this.languageDropdownValue,
  }) : super(key: key);

  @override
  _LanguageDropDownState createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        dropdownColor: Colors.grey[300],
        value: widget.languageDropdownValue,
        style: TextStyle(color: Colors.orange[800]),
        onChanged: widget.onChanged,
        items: <String>[
          'English-GB',
          'English-IE',
          'English-US',
          'English-AU',
          'English-IN',
          "English-ZA",
        ].map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
      ),
    );
  }
}
