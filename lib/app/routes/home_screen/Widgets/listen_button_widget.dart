import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/listening_root/listen.dart';

Widget listenButton(context) {
  return TextButton.icon(
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ListenPage();
      }));
    },
    icon: icon(),
    label: text(),
  );
}

Widget icon() {
  return Icon(
    Icons.timer,
    color: Colors.amber[900],
    size: 35,
  );
}

Widget text() {
  return Text(
    "Listen",
    style: TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontWeight: FontWeight.w800,
    ),
  );
}
