import 'package:flutter/material.dart';

import '../../feature/components/textfields.dart';
import '../../feature/export/export.dart';

class SearchResultView extends StatelessWidget {
  SearchResultView({Key? key}) : super(key: key);

  final DictController dictController = DictController();
  final TextController textController = TextController();

  var a;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.dismissKeyboard(),
      child: Scaffold(
        bottomNavigationBar: AdvertisementWidget(
          ad: generateAd.ad,
          unitID: AdHelper.bannerAdUnitId3,
        ),
        body: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            SizedBox(height: context.height(0.05)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width(0.05)),
              child: CustomTextField(
                controller: textController.search,
                icon: const Icon(Icons.search),
                onTap: () async => {
                  if (textController.search.text.isEmpty)
                    {
                      Get.snackbar(
                          "Warning", "Please enter a word to search for.")
                    }
                  else
                    {
                      a = await dictController
                          .fetchData(textController.search.text),
                      textController.search.clear(),
                    },
                },
              ),
            ),
            SizedBox(
              height: context.height(0.035),
            ),
            getData(),
          ],
        ),
      ),
    );
  }

  //

  Widget getData() {
    return Obx(() {
      if (a == 0) {
        return const Center(
          child: Text("Could find the word that you've searched for."),
        );
      } else {
        return dictController.word.value == null
            ? const Center(
                child: Text("Search for the word you want."),
              )
            : WordWidget(wordModel: dictController.word.value!);
      }
    });
  }
}



        // if (wordModel.value!.meaning1 == null) {
        //   await WordViewModel().addData(Word(
        //     word: wordModel.value!.word,
        //     origin: wordModel.value!.origin,
        //     meaning1: wordModel.value!.meaning1,
        //     meaning2: wordModel.value!.meaning2,
        //     example: wordModel.value!.example,
        //   ));
        // }