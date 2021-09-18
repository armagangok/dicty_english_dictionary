import 'package:flutter/material.dart';

TextFormField textFormFied(textEditingController) {
  return TextFormField(
    controller: textEditingController,
    keyboardType: TextInputType.multiline,
    maxLines: 10,
    cursorHeight: 20,
    cursorColor: Colors.black,
    maxLength: 2000,
    style: TextStyle(
      fontSize: 17,
    ),
    decoration: InputDecoration(
      fillColor: Colors.grey[200],
      filled: true,
      labelText: "edit your text!",
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
