import 'package:english_accent_dictionary/core/components/custom_app_bar.dart';
import 'package:english_accent_dictionary/core/initialization/injection/injection.dart';
import 'package:english_accent_dictionary/feature/components/word_widget.dart';
import 'package:english_accent_dictionary/feature/controller/hive_controller.dart';
import 'package:english_accent_dictionary/feature/model/word_model.dart';
import 'package:flutter/material.dart';

class RecentDetailWiew extends StatelessWidget {
  const RecentDetailWiew({
    Key? key,
    required this.wordModel,
  }) : super(key: key);
  final WordModel wordModel;
  @override
  Widget build(BuildContext context) {
    print(wordModel.meanings);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: WordWidget(
        controller: Injection.instance.locator.get<HiveController>(),
        wordModel: wordModel,
      ),
    );
  }
}
