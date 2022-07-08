import 'package:flutter/material.dart';

import '../../feature/components/textfields.dart';
import '../../feature/export/export.dart';

class SearchResultView extends StatelessWidget {
  SearchResultView({Key? key}) : super(key: key);

  final DictController dictController = DictController();
  final TextController textController = TextController();
  int a = 0;

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
            getData(),
          ],
        ),
      ),
    );
  }

  //

  Widget getData() {
    return Obx(
      () {
        if (dictController.wordModel.value == null) {
          return const Center(
            child: Text("Could not find result for this search"),
          );
        } else {
          if (a == 0) {
            a++;
            return const SizedBox();
          } else {
            return Data(wordModel: dictController.wordModel.value);
          }
        }
      },
    );
  }
}
