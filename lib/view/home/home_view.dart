import 'package:english_accent_dictionary/view/home/controller/data_controller.dart';
import 'package:flutter/material.dart';

import '../../feature/export/export.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.dismissKeyboard(),
      child: SafeArea(
        child: Scaffold(
          // bottomNavigationBar: AdvertisementWidget(
          //   ad: generateAd.ad,
          //   unitID: AdHelper.bannerAdUnitId1,
          // ),
          body: Obx(
            () => ListView(
              padding: EdgeInsets.all(context.width(0.025)),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: context.height(0.025)),
                  child: Center(
                    child: Text(
                      "Word Of The Day!",
                      style: context.textTheme.headline4!.copyWith(
                        shadows: [
                          const Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 3,
                            color: Color.fromARGB(255, 73, 73, 73),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                dataController.wordModel.value == null
                    ? const Center(
                        child: Text("An error occured while fetching word"),
                      )
                    : Padding(
                        padding: EdgeInsets.all(context.width(0.05)),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                              context.width(0.05),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(dataController.wordModel.value!.word!,
                                    style: context.textTheme.headline5),
                                const SizedBox001(),
                                Text(
                                  "Meaning: ${dataController.wordModel.value!.meaning1 ?? "Meaning not found."}",
                                ),
                                const SizedBox001(),
                                Text(
                                  "Meaning: ${dataController.wordModel.value!.meaning2 ?? "Alternative meaning not found."}",
                                ),
                                const SizedBox001(),
                                Text(
                                  "Origin: ${dataController.wordModel.value!.origin ?? "Meaning not found."}",
                                ),
                                const SizedBox001(),
                                Text(
                                  "Example: ${dataController.wordModel.value!.example ?? "Example sentence not found."}",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
