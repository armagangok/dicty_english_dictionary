import 'package:flutter/material.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import '../scaffold_body_widget/scaffold_body_widget.dart';
import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/database/word_hive_model.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        WordApi data = await wordInfo;
        Word data1 = Word(
          word: data.word,
          origin: data.origin,
          meaning1: data.meaning1,
          meaning2: data.meaning2,
          example: data.example,
        );
        await hiveHelper.addData(data1);
      },
      child: Text("Save"),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(100, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
