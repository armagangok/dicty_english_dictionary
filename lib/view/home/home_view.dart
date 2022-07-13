import 'package:flutter/material.dart';

import './controller/data_controller.dart';
import '../../core/remote/admob/banner_ad.dart';
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
          bottomNavigationBar: AdvertisementWidget(
            ad: generateAd.ad,
            unitID: AdHelper.bannerAdUnitId1,
          ),
          body: Obx(
            () {
              switch (dataController.wordModel.value) {
                case 0:
                  return noDataWidget();
                case null:
                  return waitingForDataWidget();
                default:
                  return buildtDataWidget();
              }
            },
          ),
        ),
      ),
    );
  }

  //

  Widget buildtDataWidget() {
    return Builder(
      builder: (context) {
        return ListView(
          padding: EdgeInsets.all(context.width(0.025)),
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.height(0.015)),
              child: Center(
                child: Text(
                  "Word Of The Day!",
                  style: context.textTheme.headline5!.copyWith(
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
            Padding(
              padding: EdgeInsets.all(context.width(0.05)),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(context.width(0.05)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            dataController.wordModel.value!.word!,
                            style: context.textTheme.headline6!
                                .copyWith(color: Colors.red),
                          ),
                          SpeakButton(
                            data: dataController.wordModel.value!.word!,
                          ),
                        ],
                      ),
                      const SizedBox001(),
                      dictData(
                        "Meaning: ${dataController.wordModel.value!.meaning1 ?? "Meaning not found."}",
                        icon: const Icon(Icons.menu_book),
                      ),
                      const SizedBox001(),
                      dictData(
                        "Meaning: ${dataController.wordModel.value!.meaning2 ?? "Alternative meaning not found."}",
                        icon: const Icon(Icons.menu_book),
                      ),
                      const SizedBox001(),
                      dictData(
                        "Origin: ${dataController.wordModel.value!.origin ?? "Meaning not found."}",
                        icon: const Icon(Icons.trip_origin),
                      ),
                      const SizedBox001(),
                      dictData(
                        "Example: ${dataController.wordModel.value!.example ?? "Example sentence not found."}",
                        icon: const Icon(Icons.star),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  //

  Widget waitingForDataWidget() {
    return Builder(builder: (context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                "Fetching data from source...",
                style: context.textTheme.headline6,
                maxLines: 1,
              ),
            ),
            const SizedBox001(),
            const CircularProgressIndicator()
          ],
        ),
      );
    });
  }

  //

  Center noDataWidget() {
    return const Center(
      child: Text("An error occured while fetching data."),
    );
  }
}
