import 'package:flutter/material.dart';

import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/database/words.dart';

PreferredSizeWidget appBar(word1, origin, meaning1, meaning2, example) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    actions: [
      SaveButtonWidget(
        example: example.text,
        meaning1: meaning1.text,
        meaning2: meaning2.text,
        origin: origin.text,
        word1: word1.text,
      ),
    ],
  );
}

class SaveButtonWidget extends StatelessWidget {
  final String word1;
  final String origin;
  final String meaning1;
  final String meaning2;
  final String example;

  const SaveButtonWidget({
    Key? key,
    required this.word1,
    required this.origin,
    required this.meaning1,
    required this.meaning2,
    required this.example,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.save),
      onPressed: () {
        final word = Word(
          word: word1,
          origin: origin,
          meaning1: meaning1,
          meaning2: meaning2,
          example: example,
        );
        debugPrint("$word1");
        hiveHelper.addData(word);
      },
    );
  }
}
