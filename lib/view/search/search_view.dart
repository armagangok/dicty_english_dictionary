import 'package:flutter/material.dart';

import '../../feature/export/export.dart';

class SearchResultView extends StatelessWidget {
  SearchResultView({Key? key}) : super(key: key);

  final WordController dictController = WordController();
  final TextController textController = TextController();

  @override
  Widget build(BuildContext context) {
    var a;
    return GestureDetector(
      onTap: () => context.dismissKeyboard(),
      child: Scaffold(
        // bottomNavigationBar: AdvertisementWidget(
        //   ad: generateAd.ad,
        //   unitID: AdHelper.bannerAdUnitId3,
        // ),
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
                          // margin: const EdgeInsets.all(80),
                        )
                      }
                    else
                      {
                        a = await dictController
                            .fetchWord(textController.search.text),
                        textController.search.clear(),
                        if (a == 0)
                          Get.snackbar(
                            "Warning",
                            "Not found the word that you have searched for.",
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(milliseconds: 3600),
                            
                          )
                      },
                  };
                },
              ),
            ),
            SizedBox(height: context.height(0.035)),
            getData(a),
          ],
        ),
      ),
    );
  }

  //

  //

  Widget getData(a) {
    return Obx(
      () {
        if (a == 0) {
          return const Center();
        } else {
          return dictController.word.value == null
              ? const Center(
                  child: Text("Search for the word you want."),
                )
              : WordWidget(wordModel: dictController.word.value!);
        }
      },
    );
  }
}
