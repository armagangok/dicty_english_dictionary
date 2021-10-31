import 'package:flutter/material.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import 'text_widget.dart';

Widget futureBuilder(wordInfo) {
  return FutureBuilder<WordApi>(
    future: wordInfo,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return dictionaryDatas(snapshot);
      } else if (snapshot.hasError) {
        print(snapshot.error);

        return Text('Try agin or there is no word in dictionary.');
      }
      return circularProgressIndicator();
    },
  );
}

Widget dictionaryDatas(snapshot) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 5,
      horizontal: 2,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleText(snapshot),
        Divider(),
        meaning1Text(snapshot),
        Divider(),
        meaning2Text(snapshot),
        Divider(),
        originText(snapshot),
        Divider(),
        exampleText(snapshot),
        Divider(),
      ],
    ),
  );
}

Widget circularProgressIndicator() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircularProgressIndicator(
        color: Colors.amber[900],
      ),
    ],
  );
}
