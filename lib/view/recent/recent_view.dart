import 'package:flutter/material.dart';

import '../../../feature/export/export.dart';
import '../../core/local/database/services/hive_service.dart';
import '../../core/remote/api/models/word_model.dart';

class RecentView extends StatelessWidget {
  RecentView({Key? key}) : super(key: key);

  final TextToSpeech textToSpeech = TextToSpeech.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width(0.04)),
            child: ValueListenableBuilder(
              valueListenable: HiveService.instance.getHiveBox.listenable(),
              builder: (context, Box<WordModel> wordBox, _) => wordBox.isEmpty
                  ? noRecentSearch()
                  : recentSearchBuilder(HiveService.instance.getAll()),
            ),
          ),
        ),
      ),
    );
  }

  //

  Widget recentSearchBuilder(List<WordModel> wordList) {
    return Builder(
      builder: (context) {
        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox001(),
          padding: EdgeInsets.only(top: context.height(0.015)),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: wordList.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(context.width(0.013)),
            child: RecentItem(
              wordModel: wordList[index],
              index: index,
            ),
          ),
        );
      },
    );
  }

  //

  Widget noRecentSearch() {
    return Builder(
      builder: (context) {
        return Center(
          child: FittedBox(
            child: Text(
              "There is no recent search you have made.",
              style: context.textTheme.headline6,
              maxLines: 1,
            ),
          ),
        );
      },
    );
  }
}
