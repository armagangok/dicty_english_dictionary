import 'package:flutter/material.dart';
import 'package:wordmind/services/fetch_word.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/database/words.dart';
import 'future_builder_widget.dart';

late Future wordInfo;

class SearchWordButtonWidget extends StatelessWidget {
  final TextEditingController textController;
  const SearchWordButtonWidget({Key? key, required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final String text = textController.text;

        wordInfo = fetchWord(text);
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    futureBuilder(wordInfo),
                    saveToDatabaseButton(wordInfo),
                  ],
                ),
              ),
            );
          },
        );
      },
      icon: Icon(Icons.search, size: 30),
    );
  }
}

Widget saveToDatabaseButton(Future<dynamic> wordInfo) {
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
      print(data1.word);

      hiveHelper.addData(data1);
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
