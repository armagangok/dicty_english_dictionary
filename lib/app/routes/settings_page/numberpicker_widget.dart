import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerWidget extends StatefulWidget {
  NumberPickerWidget({Key? key}) : super(key: key);

  @override
  _NumberPickerWidgetState createState() => _NumberPickerWidgetState();
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  int currentIntValue = 15;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Loop time",
          style: TextStyle(fontSize: 20),
        ),
        NumberPicker(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          value: currentIntValue,
          axis: Axis.horizontal,
          minValue: 0,
          maxValue: 40,
          step: 1,
          haptics: true,
          itemHeight: 60,
          itemWidth: 40,
          selectedTextStyle: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
          itemCount: 5,
          onChanged: (value) => setState(() => currentIntValue = value),
        ),
      ],
    );
  }
}
