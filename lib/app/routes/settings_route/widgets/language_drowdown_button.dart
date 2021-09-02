import 'package:flutter/material.dart';

class LanguagePicker extends StatefulWidget {
  LanguagePicker({Key? key}) : super(key: key);

  @override
  _LanguagePickerState createState() => _LanguagePickerState();
}

class _LanguagePickerState extends State<LanguagePicker> {
  String _dropdownValue = 'English-UK';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Choose language",
          style: TextStyle(fontSize: 20),
        ),
        Center(
          child: DropdownButton<String>(
            dropdownColor: Colors.grey[300],
            value: _dropdownValue,
            style: TextStyle(color: Colors.blue[500]),
            onChanged: (String? newValue) {
              setState(() {
                _dropdownValue = newValue!;
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
    );
  }
}
