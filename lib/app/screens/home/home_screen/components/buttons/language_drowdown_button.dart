import 'package:flutter/material.dart';

class LanguageDropDown extends StatelessWidget {
  final Function(String? lang) onChanged;
  String languageDropdownValue;
  LanguageDropDown({
    Key? key,
    required this.onChanged,
    required this.languageDropdownValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        dropdownColor: Colors.grey[300],
        value: languageDropdownValue,
        style: TextStyle(color: Colors.orange[800]),
        onChanged: onChanged,
        items: <String>[
          'English-GB',
          'English-IE',
          'English-US',
          'English-AU',
          'English-IN',
          "English-ZA",
        ]
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
      ),
    );
  }
}
