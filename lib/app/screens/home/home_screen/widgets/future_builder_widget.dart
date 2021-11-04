import 'package:flutter/material.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import '../../../../core/components/text_widgets/text_widget.dart';

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
        horizontal: 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          textWidget("WORD: " + "${snapshot.data!.word ?? ''}"),
          Divider(),
          textWidget("MEANING:  " + "${snapshot.data!.meaning1 ?? ''}"),
          Divider(),
          textWidget("MEANING:  " + "${snapshot.data!.meaning2 ?? ''}"),
          Divider(),
          textWidget("ORIGIN:  " + "${snapshot.data!.origin ?? ''}"),
          Divider(),
          textWidget("EXAMPLE: " + "${snapshot.data!.example ?? ''}"),
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
}
