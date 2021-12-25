import 'package:flutter/material.dart';
import '../../core/remote/api/models/word_model.dart';
import 'home/components/stacks/future_builder_widget.dart';


late Future<WordModel> wordInfo;

class SearchResultView extends StatelessWidget {
  const SearchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilderWidget(wordInfo: wordInfo),
          ],
        ),
      ),
    );
  }
}
