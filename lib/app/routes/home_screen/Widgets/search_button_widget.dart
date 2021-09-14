import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/search_screen/search.dart';

Widget searchButton(context) {
  return TextButton.icon(
    label: Text(
      "Search",
      style: TextStyle(
        fontSize: 35,
        color: Colors.black,
        fontWeight: FontWeight.w800,
      ),
    ),
    icon: Icon(
      Icons.search,
      size: 35,
      color: Colors.amber[900],
    ),
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Search();
      }));
    },
  );
}
