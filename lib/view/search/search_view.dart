import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../core/remote/api/viewmodels/word_viewmodels.dart';
import '../../feature/components/textfields.dart';
import '../../feature/export/export.dart';
import '../home/components/dict_data_stack.dart';
import '../home/controller/text_controller.dart';

class SearchResultView extends StatelessWidget {
  SearchResultView({Key? key}) : super(key: key);

  final WordViewModelAPI wordViewModelAPI = WordViewModelAPI();
  final TextController textController = TextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AdvertisementWidget(
        ad: generateAd.ad,
        unitID: adHelper.bannerAdUnitId3,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.width(0.05),
            ),
            child: CustomTextField(
              controller: textController.search,
              icon: const Icon(Icons.search),
              onTap: () async => {
                if (textController.search.text == "" ||
                    textController.search.text == " ")
                  {
                    Get.snackbar(
                        "Warning", "Please enter a word to search for.")
                  }
                else
                  {
                    await wordViewModelAPI
                        .fetchData(textController.search.text),
                    textController.search.clear(),
                  },
              },
            ),
          ),
          getData(wordViewModelAPI),
        ],
      ),
    );
  }

  //

  Widget getData(WordViewModelAPI wordViewModelAPI) {
    return Obx(
      () => Data(wordModel: wordViewModelAPI.wordModel.value),
    );
  }
}
