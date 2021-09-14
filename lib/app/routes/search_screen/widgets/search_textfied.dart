import 'package:flutter/material.dart';

Widget searchTextField(textController) {
  return TextFormField(
    controller: textController,
    decoration: InputDecoration(
      labelText: 'type a word or phrase',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(),
      ),
    ),
  );
}
