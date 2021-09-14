import 'package:flutter/material.dart';
import 'package:wordmind/API/api_model.dart';
import 'package:wordmind/app/database/hive.dart';
import 'package:wordmind/app/routes/search_screen/widgets/future_builder_widget.dart';
import 'package:wordmind/models/words.dart';

late Future wordInfo;

@override
Widget searchButton(textController, context) {
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    futureBuilder(wordInfo),
                    saveToDatabaseButton(wordInfo),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
    icon: Icon(
      Icons.search,
      size: 30,
    ),
  );
}

Widget saveToDatabaseButton(Future<dynamic> wordInfo) {
  return ElevatedButton(
    onPressed: () async {
      WordApi data = await wordInfo;

      var meaning = data.word.toString().toUpperCase() +
          ": " +
          "means that, " +
          data.meaning1.toString() +
          "\n\nAnother meaning: " +
          data.meaning2.toString() +
          "\n\nSample sentence: " +
          data.example.toString();
      Word data1 = Word(meaning);
      print(data1.word);

      addData(data1);
    },
    child: Text("Save"),
    style: ElevatedButton.styleFrom(
      primary: Colors.grey[600],
      minimumSize: Size(100, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
  );
}
