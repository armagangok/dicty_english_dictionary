import 'package:flutter/material.dart';
import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/database/words.dart';

class SaveManualWordButton extends StatelessWidget {
  const SaveManualWordButton({
    Key? key,
    required this.word1,
    required this.origin,
    required this.meaning1,
    required this.meaning2,
    required this.example,
  }) : super(key: key);

  final TextEditingController word1;
  final TextEditingController origin;
  final TextEditingController meaning1;
  final TextEditingController meaning2;
  final TextEditingController example;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final word = Word(
            word: word1.text,
            origin: origin.text,
            meaning1: meaning1.text,
            meaning2: meaning2.text,
            example: example.text,
          );
          hiveHelper.addData(word);
          word1.clear();
          origin.clear();
          meaning1.clear();
          meaning2.clear();
          example.clear();
        },
        child: Text("save"),
      ),
    );
  }
}
