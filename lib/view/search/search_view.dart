import 'package:flutter/material.dart';

import '../../feature/components/word_widget.dart';
import '../../feature/export/export.dart';
import 'controller/ad_controller.dart';

class SearchResultView extends StatelessWidget {
  final TextController textController = TextController();
  // final AdController searchController = Get.put(AdController());

  final SearchWordController searchWordController =
      SearchWordController.instance;

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
              onTap: () async => searchForTheWord(),
            ),
          ),
          body: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              getData(searchWordController.wordModel.value),
            ],
          ),
        ),
      ),
    );
  }

  //

  void searchForTheWord() async {
    if (textController.search.text.isEmpty) {
      Get.snackbar(
        "Warning",
        "Please enter a text to search for!",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(milliseconds: 3000),
      );
    } else {
      // await searchController.showInterstitialAd();
      await searchWordController.fetchWord(textController.search.text);
      textController.search.clear();
    }
  }

  //

  Widget getData(a) {
    return Obx(
      () {
        if (a == 0) {
          return const Center();
        } else {
          return searchWordController.wordModel.value == null
              ? const Center(child: Text("Search for the word you want."))
              : WordWidget(
                  wordModel: searchWordController.wordModel.value,
                  controller: searchWordController,
                );
        }
      },
    );
  }
}
