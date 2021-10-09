import 'package:flutter/material.dart';
import 'package:wordmind/app/screens/word_adding_root/add_word.dart';
import 'widgets.dart';

Widget typeWordButton(context) {
  return TextButton.icon(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddingPage()),
      );
    },
    icon: iconButton(Icon(Icons.text_fields)),
    label: text("Type Word", context),
  );
}
