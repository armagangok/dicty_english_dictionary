import 'package:flutter/material.dart';

class LanguageDropDown extends StatelessWidget {
  final Function(String? lang) onChanged;
  String dropdownValue;
  LanguageDropDown({
    Key? key,
    required this.onChanged,
    required this.dropdownValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: dropdownValue,
        onChanged: onChanged,
        
        borderRadius: BorderRadius.all(Radius.circular(20)),
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
