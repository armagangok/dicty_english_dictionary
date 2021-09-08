import 'package:flutter/material.dart';
import 'package:wordmind/app/database/hive.dart';
import 'package:wordmind/models/words.dart';

Widget saveButton(textController) {
  return Column(
    children: <Widget>[
      Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.grey[500]),
          onPressed: () {
            final word = Word(textController.text);
            addData(word);
          },
          child: Text(
            "Save",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
  );
}
