import 'package:flutter/material.dart';
import 'package:wordmind/app/screens/search_screen/search.dart';
import 'widgets.dart';

Widget searchButton(context) {
  return TextButton.icon(
    label: text("Search", context),
    icon: iconButton(Icon(Icons.search)),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Search()),
      );
    },
  );
}
