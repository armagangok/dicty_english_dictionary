import 'package:flutter/material.dart';

Widget textField(textController) {
  return TextFormField(
    controller: textController,
    keyboardType: TextInputType.multiline,
    maxLines: 8,
    cursorHeight: 20,
    cursorColor: Colors.black,
    maxLength: 2000,
    style: TextStyle(
      fontSize: 20,
    ),
    decoration: InputDecoration(
      labelText: 'edit text',
      // hintText: "Type",

      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
          width: 3,
        ),
      ),
      fillColor: Colors.white,
      filled: true,
    ),
  );
}
