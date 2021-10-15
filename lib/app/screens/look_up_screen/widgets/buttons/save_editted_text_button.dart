import 'package:flutter/material.dart';
import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/database/words.dart';



Widget saveEdittedTextButton(textEditingController, index) {
  return IconButton(
    icon: Icon(
      Icons.save,
    ),
    onPressed: () {
      final word = Word(textEditingController.text);
      hiveHelper.deleteData(index);
      hiveHelper.addData(word);
    },
  );
}
