import 'package:flutter/material.dart';
import 'package:wordmind/app/database/hive.dart';
import 'package:wordmind/models/words.dart';

PreferredSizeWidget appBar(textController) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.grey[400],
    actions: [
      saveButton(textController),
    ],
  );
}

Widget saveButton(textController) {
  return IconButton(
    icon: Icon(
      Icons.save,
    ),
    onPressed: () {
      final word = Word(textController.text);
      addData(word);
    },
  );
}
