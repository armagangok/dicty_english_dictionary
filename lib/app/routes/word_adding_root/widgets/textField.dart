import 'package:flutter/material.dart';

Widget textField(textController) {
  return TextFormField(
    controller: textController,
    keyboardType: TextInputType.multiline,
    maxLines: 10,
    cursorHeight: 20,
    cursorColor: Colors.black,
    style: TextStyle(
      fontSize: 17,
    ),
    decoration: InputDecoration(
      fillColor: Colors.grey[200],
      filled: true,
      labelText: "type your research",
      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          color: Colors.black,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
    ),
  );
}
