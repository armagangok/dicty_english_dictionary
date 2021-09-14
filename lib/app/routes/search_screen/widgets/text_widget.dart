import 'package:flutter/material.dart';

Widget title(snapshot) {
  return Text(
    ("word: ") + "${snapshot.data!.word ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}

Widget meaning1(snapshot) {
  return Text(
    "meaning:  " + "${snapshot.data!.meaning1 ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}

Widget meaning2(snapshot) {
  return Text(
    "meaning:  " + "${snapshot.data!.meaning2 ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}

Widget origin(snapshot) {
  return Text(
    "origin:  " + "${snapshot.data!.origin ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}

Widget example(snapshot) {
  return Text(
    "example " + "${snapshot.data!.example ?? ''}",
    style: TextStyle(fontSize: 18),
  );
}
