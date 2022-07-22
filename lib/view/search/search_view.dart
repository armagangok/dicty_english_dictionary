import 'package:flutter/material.dart';

import '../../feature/components/word_widget.dart';
import '../../feature/export/export.dart';
import 'controller/controller.dart';

class SearchResultView extends StatelessWidget {
  
  final TextController textController = TextController();
  final SearchController searchController = Get.put(SearchController());

  SearchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.dismissKeyboard(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: CustomTextField(
              controller: textController.search,
              icon: const Icon(Icons.search),
              onTap: () async => await newMethod(),
            ),
          ),
          body: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              getData(WordController.instance.wordModel.value),
            ],
          ),
        ),
      ),
    );
  }

  //

   newMethod() async {
    return {
      if (textController.search.text.isEmpty)
        {
          Get.snackbar(
            "Warning",
            "Please enter a word to search for.",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(milliseconds: 3600),
          ),
        }
      else
        {
          // await searchController.showInterstitialAd(),
          await WordController.instance.fetchWord(textController.search.text),
          textController.search.clear(),
        },
    };
  }

  //

  Widget getData(a) {
    return Obx(
      () {
        if (a == 0) {
          return const Center();
        } else {
          return WordController.instance.wordModel.value == null
              ? const Center(child: Text("Search for the word you want."))
              : NewWordWidget(
                  wordModel: WordController.instance.wordModel.value,
                  controller: WordController.instance,
                );
          // WordWidget(wordModel: WordController.instance.wordModel.value!);
        }
      },
    );
  }
}



          // bottomNavigationBar: AdvertisementWidget(
          //   ad: generateAd.ad,
          //   unitID: AdHelper.bannerAdUnitId3,
          // ),