import 'package:flutter/material.dart';

import '../../../feature/export/export.dart';

class RecentView extends StatelessWidget {
  RecentView({
    Key? key,
  }) : super(key: key);

  final WordViewModel _wordViewModel = Get.put(WordViewModel());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width(0.04)),
            child: ValueListenableBuilder(
              valueListenable: Hive.box("words").listenable(),
              builder: (context, Box wordBox, _) {
                return wordBox.isEmpty
                    ? noRecentSearch()
                    : recentSearchBuilder(wordBox);
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

  ListView recentSearchBuilder(Box<dynamic> wordBox) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox001();
      },
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: wordBox.length,
      itemBuilder: (context, index) {
        final data = _wordViewModel.getData(index);

        return Slidable(
          actionPane: const SlidableScrollActionPane(),
          actionExtentRatio: 0.15,
          actions: <Widget>[
            SlideActionWidget(
              data: data,
              iconData: CupertinoIcons.speaker_3_fill,
              iconText: "",
              bgColor: Colors.blue,
              onTap: () async => await speakWord(data, context),
            ),
            SlideActionWidget(
              bgColor: Colors.red,
              iconData: CupertinoIcons.trash,
              iconText: "",
              onTap: () async => await _wordViewModel.deleteData(index),
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
            child: RecentItem(
              data: data,
              index: index,
            ),
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
