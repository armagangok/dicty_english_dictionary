import 'package:english_accent_dictionary/core/remote/api/models/word_model.dart';
import 'package:flutter/material.dart';

import '../../feature/components/textfields.dart';
import '../../feature/export/export.dart';

class SearchResultView extends StatelessWidget {
  SearchResultView({Key? key}) : super(key: key);

  final DictController dictController = DictController();
  final TextController textController = TextController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.dismissKeyboard(),
      child: Scaffold(
        bottomNavigationBar: AdvertisementWidget(
          ad: generateAd.ad,
          unitID: adHelper.bannerAdUnitId3,
        ),
        body: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            SizedBox(
              height: context.height(0.05),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width(0.05),
              ),
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
                      await dictController
                          .fetchData(textController.search.text),
                      textController.search.clear(),
                    },
                },
              ),
            ),
            SizedBox(
              height: context.height(0.035),
            ),
            textController.search.text.isEmpty
                ? const Center(child: Text("Please type something and search."))
                : getData(),
          ],
        ),
      ),
    );
  }

  //

  Widget getData() {
    return FutureBuilder<WordModel?>(
      future: DictController().fetchData(textController.search.text),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Column(
              children: const [
                Text("Waiting for the data..."),
                CircularProgressIndicator(),
              ],
            );

          case ConnectionState.none:
            return const Center(
              child: Text("Please check your internet connection."),
            );

          case ConnectionState.done:
            if (snapshot.hasData) {
              var data = snapshot.data!;
              return WordWidget(wordModel: data);
            } else {
              return const Center(
                child: Text("Something went wrong."),
              );
            }

          default:
            return const Text("something");
        }
      },
    );
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