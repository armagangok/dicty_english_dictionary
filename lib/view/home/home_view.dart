import 'package:english_accent_dictionary/view/search/search_view.dart';
import 'package:flutter/material.dart';

import '../../core/components/data_loading_widgets.dart';
import '../../feature/components/word_widget.dart';
import '../../feature/export/export.dart';
import 'controller/data_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final DataController dataController = Get.put(DataController.instance);
  final TextController textController = Get.put(TextController());
  final SearchWordController searchController =
      Get.put(SearchWordController.instance);

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
          body: Obx(
            () {
              switch (dataController.wordModel.value) {
                case 0:
                  return const NoDataWidget();
                case null:
                  return const WaitingForDataWidget();
                default:
                  return ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      WordWidget(
                        wordModel: dataController.wordModel.value,
                        controller: dataController,
                      ),
                    ],
                  );
              }
            },
          ),
        ),
      ),
    );
  }

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
      Get.to(SearchResultView());
      await searchController.fetchWord(textController.search.text);
      textController.search.clear();
    }
  }

  //

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Word Of The Day!",
        style: context.textTheme.labelLarge!.copyWith(
          fontSize: 20,
        ),
      ),
    );
  }
}
