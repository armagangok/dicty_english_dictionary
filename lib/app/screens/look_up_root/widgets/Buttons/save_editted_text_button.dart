import 'package:flutter/material.dart';
import 'package:wordmind/app/database/hive.dart';
import 'package:wordmind/app/database/words.dart';

var helper = HiveHelper();

Widget saveEdittedTextButton(textEditingController, index) {
  return IconButton(
    icon: Icon(
      Icons.save,
    ),
    onPressed: () {
      final word = Word(textEditingController.text);
      helper.deleteData(index);
      helper.addData(word);
    },
  );
}
