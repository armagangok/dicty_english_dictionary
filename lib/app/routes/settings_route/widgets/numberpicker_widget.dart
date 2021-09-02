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
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: NumberPicker(
            textStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            value: currentIntValue,
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
            onChanged: (value) => setState(() => currentIntValue = value),
          ),
        ),
      ],
    );
  }
}
