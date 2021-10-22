import 'package:flutter/material.dart';

import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/database/words.dart';

PreferredSizeWidget appBar(
  TextEditingController word,
  TextEditingController origin,
  TextEditingController meaning1,
  TextEditingController meaning2,
  TextEditingController example,
) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    actions: [
      SaveButtonWidget(
        example: example.text,
        meaning1: meaning1.text,
        meaning2: meaning2.text,
        origin: origin.text,
        word1: word.text,
      ),
    ],
  );
}

class SaveButtonWidget extends StatelessWidget {
  String? word1;
  String? origin;
  String? meaning1;
  String? meaning2;
  String? example;

   SaveButtonWidget({
    Key? key,
     this.word1,
     this.origin,
     this.meaning1,
     this.meaning2,
     this.example,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.save),
      onPressed: () {
        print("word: $word1");
        print("origin: $origin");
        print("meaning: $meaning1");
        print("meaning: $meaning2");
        print("example: $example");
        final word = Word(
          word: word1,
          origin: origin,
          meaning1: meaning1,
          meaning2: meaning2,
          example: example,
        );
        hiveHelper.addData(word);
      },
    );
  }
}
