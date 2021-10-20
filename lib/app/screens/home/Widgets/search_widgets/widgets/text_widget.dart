import 'package:flutter/material.dart';

Widget titleText(snapshot) {
  return Text(
    ("word: ") + "${snapshot.data!.word ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}

Widget meaning1Text(snapshot) {
  return Text(
    "meaning:  " + "${snapshot.data!.meaning1 ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}

Widget meaning2Text(snapshot) {
  return Text(
    "meaning:  " + "${snapshot.data!.meaning2 ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}

Widget originText(snapshot) {
  return Text(
    "origin:  " + "${snapshot.data!.origin ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}

Widget exampleText(snapshot) {
  return Text(
    "example " + "${snapshot.data!.example ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}
