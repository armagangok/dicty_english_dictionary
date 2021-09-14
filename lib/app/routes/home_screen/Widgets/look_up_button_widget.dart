import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/look_up_root/look_up.dart';

Widget lookUpButton(context) {
  return TextButton.icon(
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return LookUpPage();
      }));
    },
    icon: iconButton(),
    label: text(),
  );
}

Widget text() {
  return Text(
    "Look Up",
    style: TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontWeight: FontWeight.w800,
    ),
  );
}

Widget iconButton() {
  return Icon(
    Icons.text_snippet_outlined,
    color: Colors.amber[900],
    size: 35,
  );
}
