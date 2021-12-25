import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/local/database/models/word_hive_model.dart';
import '../../../../../../core/local/database/viewmodels/word_viewmodel.dart';
import '../../../../../../core/remote/api/models/word_model.dart';
import 'dict_data_stack.dart';

class FutureBuilderWidget extends StatelessWidget {
  final Future<WordModel> wordInfo;
  const FutureBuilderWidget({
    Key? key,
    required this.wordInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final WordViewModel _wordViewModel = Provider.of<WordViewModel>(context);

    return FutureBuilder<WordModel>(
      future: wordInfo,
      builder: (context, snapshot) {
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
              DisctionaryDataStack(snapshot: snapshot),
            ],
          );
        } else if (snapshot.hasError) {
          return const Text('Try again or there is no the word in dictionary.');
        }
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
