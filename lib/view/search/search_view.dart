import 'package:flutter/material.dart';

import '../../feature/components/textfields.dart';
import '../../feature/export/export.dart';

class SearchResultView extends StatelessWidget {
  SearchResultView({Key? key}) : super(key: key);

  final DictController dictController = DictController();
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
                if (textController.search.text.isEmpty)
                  {
                    Get.snackbar(
                        "Warning", "Please enter a word to search for.")
                  }
                else
                  {
                    await dictController.fetchData(textController.search.text),
                    textController.search.clear(),
                  },
              },
            ),
          ),
          getData(),
        ],
      ),
    );
  }

  //

  Widget getData() {
    if (textController.search.text.isEmpty) {
      return const Center(
        child: Text("Please search for the result"),
      );
    } else {
      return Obx(
        () {
          return Data(wordModel: dictController.wordModel.value);
        },
      );
    }
  }
}
