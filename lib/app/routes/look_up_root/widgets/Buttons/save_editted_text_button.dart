import 'package:flutter/material.dart';
import 'package:wordmind/app/database/hive.dart';
import 'package:wordmind/models/words.dart';

Widget saveButton(TextEditingController textEditingController, index) {
  return IconButton(
    icon: Icon(
      Icons.save,
    ),
    onPressed: () {
      final word = Word(textEditingController.text);
      deleteData(index);
      addData(word);
    },
  );
}
