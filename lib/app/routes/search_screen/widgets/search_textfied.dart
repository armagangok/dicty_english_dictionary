import 'package:flutter/material.dart';

Widget searchTextField(textController) {
  return TextFormField(
    controller: textController,
    decoration: InputDecoration(
      fillColor: Colors.grey[200],
      filled: true,
      labelText: "type your research",
      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
    ),
  );
}
