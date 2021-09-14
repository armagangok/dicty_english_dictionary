import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/word_adding_root/add_word.dart';

import 'widgets.dart';

Widget typeWordButton(context) {
  return TextButton.icon(
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return AddingPage();
      }));
    },
    icon: iconButton(Icon(Icons.text_fields)),
    label: text("Type Word"),
  );
}
