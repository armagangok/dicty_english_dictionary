import 'package:flutter/material.dart';

import '../../feature/export/export.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WordModel word = WordModel(
        word: "Hello! or an equivalent greeting.",
        meaning2:
            "Heelo Mr. Johson how are you doing doing today? daljdlaksjldjkaslkjdlasjkdlkasjldjasljkdlasjkdlkajsldkjasljdlkasdjalk");
    return GestureDetector(
      onTap: () => context.dismissKeyboard(),
      child: SafeArea(
        child: Scaffold(
          // bottomNavigationBar: AdvertisementWidget(
          //   ad: generateAd.ad,
          //   unitID: AdHelper.bannerAdUnitId1,
          // ),
          body: ListView(
            padding: EdgeInsets.all(context.width(0.025)),
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.all(context.width(0.025)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Word of the day feature will be enabled soon! \n\nThank for you patience!",
                      style: context.textTheme.headline5,
                    ),
                    // const SizedBox001(),
                    // Text(word.word!),
                    // const SizedBox001(),
                    // Text(
                    //   "Meaning: ${word.meaning1 ?? "Meaning not found."}",
                    // ),
                    // const SizedBox001(),
                    // Text(
                    //   "Meaning: ${word.meaning2 ?? "Alternative meaning not found."}",
                    // ),
                    // const SizedBox001(),
                    // Text(
                    //   "Origin: ${word.meaning1 ?? "Meaning not found."}",
                    // ),
                    // const SizedBox001(),
                    // Text(
                    //   "Example: ${word.meaning1 ?? "Example sentence not found."}",
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
