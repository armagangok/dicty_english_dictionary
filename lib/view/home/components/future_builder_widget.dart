import 'package:flutter/material.dart';

import './dict_data_stack.dart';
import '../../../../../core/local/database/models/word_hive_model.dart';
import '../../../../../core/local/database/viewmodels/word_viewmodel.dart';
import '../../view_search_result.dart';

class FutureBuilderWidget extends StatelessWidget {
  const FutureBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WordViewModel _wordViewModel = WordViewModel();

    return FutureBuilder<dynamic>(
      future: wordInfo,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData) {
              Word data1 = Word(
                word: snapshot.data?.word,
                origin: snapshot.data?.origin,
                meaning1: snapshot.data?.meaning1,
                meaning2: snapshot.data?.meaning2,
                example: snapshot.data?.example,
              );

              _wordViewModel.addData(data1).then((value) => null);
              return Column(
                children: [
                  DictionaryDataStack(snapshot: snapshot),
                ],
              );
            } else if (snapshot.hasError) {
              return const Text(
                  'Try again or there is no the word in dictionary.');
            } else {
              return const Text("An error occured");
            }

          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case ConnectionState.none:
            return const Center(
              child: Text("Check your internet connection."),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
