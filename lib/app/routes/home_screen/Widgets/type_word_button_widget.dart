import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/word_adding_root/add_word.dart';

Widget typeWordButton(context) {
  return TextButton.icon(
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return AddingPage();
      }));
    },
    icon: icon(),
    label: text(),
  );
}

Widget icon() {
  return Icon(
    Icons.text_fields,
    size: 35,
    color: Colors.amber[900],
  );
}

Widget text() {
  return Text(
    "Type Word",
    style: TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontWeight: FontWeight.w800,
    ),
  );
}
