import 'package:flutter/material.dart';

Widget titleText(snapshot) {
  return Text(
    ("WORD: ") + "${snapshot.data!.word ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}

Widget meaning1Text(snapshot) {
  return Text(
    "MEANING:  " + "${snapshot.data!.meaning1 ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}

Widget meaning2Text(snapshot) {
  return Text(
    "MEANING:  " + "${snapshot.data!.meaning2 ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}

Widget originText(snapshot) {
  return Text(
    "ORIGIN:  " + "${snapshot.data!.origin ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}

Widget exampleText(snapshot) {
  return Text(
    "EXAMPLE: " + "${snapshot.data!.example ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}
