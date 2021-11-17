import 'package:flutter/material.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import '../../view_home.dart';
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
      child: Text(
        "save",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height / 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
