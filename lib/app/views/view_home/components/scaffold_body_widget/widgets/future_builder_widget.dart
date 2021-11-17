import 'package:flutter/material.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import 'package:wordmind/app/views/view_word_details/word_details_view.dart';

class FutureBuilderWidget extends StatelessWidget {
  final Future<WordApi> wordInfo;
  const FutureBuilderWidget({
    Key? key,
    required this.wordInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WordApi>(
      future: wordInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return dictionaryDatas(snapshot);
        } else if (snapshot.hasError) {
          return Text('Try again or there is no the word in dictionary.');
        }
        return circularProgressIndicator();
      },
    );
  }

  Widget dictionaryDatas(snapshot) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 1.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          f(
            snapshot.data.word ?? "",
            size: 25,
            color: Colors.red,
            fWeigth: FontWeight.w700,
          ),
          SizedBox(height: 10),
          f(
            snapshot.data.meaning1 ?? "",
            size: 14,
            fWeigth: FontWeight.w400,
            icon: Icon(Icons.menu_book),
          ),
          SizedBox(height: 10),
          f(
            snapshot.data.meaning2 ?? "",
            size: 14,
            fWeigth: FontWeight.w400,
            icon: Icon(Icons.menu_book),
          ),
          SizedBox(height: 10),
          f(
            "Origin: " + snapshot.data.origin,
            size: 14,
            fWeigth: FontWeight.w400,
          ),
          SizedBox(height: 10),
          f(
            snapshot.data.example ?? "",
            icon: Icon(Icons.star),
            size: 14,
            fWeigth: FontWeight.w400,
          ),
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
}
