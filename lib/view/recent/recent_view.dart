import 'package:english_accent_dictionary/core/local/database/services/hive_service.dart';
import 'package:flutter/material.dart';

import '../../../feature/export/export.dart';
import '../../core/remote/api/models/word_model.dart';

class RecentView extends StatelessWidget {
  const RecentView({
    Key? key,
  }) : super(key: key);

  // final HiveController _wordViewModel = Get.put(HiveController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width(0.04)),
            child: ValueListenableBuilder(
              valueListenable: Hive.box<WordModel>("hiveWords").listenable(),
              builder: (context, Box<WordModel> wordBox, _) {
                List<WordModel> wordList = [];

                for (var element in wordBox.values) {
                  print(element.word);
                  wordList.add(element);
                }
                return wordBox.isEmpty
                    ? noRecentSearch()
                    : recentSearchBuilder(wordList);
              },
            ),
          ),
        ),

        //

        // bottomNavigationBar: AdvertisementWidget(
        //   ad: generateAd.ad,
        //   unitID: AdHelper.bannerAdUnitId4,
        // ),
      ),
    );
  }

  //

  ListView recentSearchBuilder(List<WordModel> wordList) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox001();
      },
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: wordList.length,
      itemBuilder: (context, index) {
        // final data = HiveController.instance.getData(index);

        return Slidable(
          actionPane: const SlidableScrollActionPane(),
          actionExtentRatio: 0.15,
          actions: <Widget>[
            SlideActionWidget(
              data: wordList[index],
              iconData: CupertinoIcons.speaker_3_fill,
              iconText: "",
              bgColor: Colors.blue,
              onTap: () async => await speakWord(wordList[index], context),
            ),
            SlideActionWidget(
              bgColor: Colors.red,
              iconData: CupertinoIcons.trash,
              iconText: "",
              onTap: () async =>
                  await HiveService.instance.deleteData(index),
            ),
          ],
          // secondaryActions: <Widget>[
          //   SlideActionWidget(
          //     onTap: () => Get.to(DetailsView(data: data)),
          //     icon: Icons.info,
          //     iconText: "Details",
          //     bgColor: Colors.green,
          //   ),
          // ],
          child: Padding(
            padding: EdgeInsets.all(context.width(0.015)),
            child: RecentItem(data: wordList[index]),
          ),
        );
      },
    );
  }

  //

  Widget noRecentSearch() {
    return Builder(builder: (context) {
      return Center(
        child: FittedBox(
          child: Text(
            "There is no recent search you have made.",
            style: context.textTheme.headline6,
            maxLines: 1,
          ),
        ),
      );
    });
  }
}
