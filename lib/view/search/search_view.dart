import 'package:flutter/material.dart';

import '../../feature/export/export.dart';
import '../../feature/components/word_widget.dart';
import 'controller/controller.dart';

class SearchResultView extends StatelessWidget {
  final WordController wordController = WordController();
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
          body: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              SizedBox(height: context.height(0.05)),
              Padding(
                padding: context.symmetric(horizontal: 0.05),
                child: CustomTextField(
                  controller: textController.search,
                  icon: const Icon(Icons.search),
                  onTap: () async {
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
                          await wordController
                              .fetchWord(textController.search.text),
                          textController.search.clear(),
                        },
                    };
                  },
                ),
              ),
              SizedBox(height: context.height(0.035)),
              getData(wordController.wordModel.value),
            ],
          ),
        ),
      ),
    );
  }

  //

  Widget getData(a) {
    return Obx(
      () {
        if (a == 0) {
          return const Center();
        } else {
          return wordController.wordModel.value == null
              ? const Center(child: Text("Search for the word you want."))
              : NewWordWidget(
                  wordModel: wordController.wordModel.value,
                  controller: wordController,
                );
          // WordWidget(wordModel: wordController.wordModel.value!);
        }
      },
    );
  }
}



          // bottomNavigationBar: AdvertisementWidget(
          //   ad: generateAd.ad,
          //   unitID: AdHelper.bannerAdUnitId3,
          // ),