import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import 'package:wordmind/advertisement/ad_helper.dart';
import 'package:wordmind/advertisement/init_add.dart';
import 'package:wordmind/app/controllers/text_editing_controllers.dart';
import 'package:wordmind/app/views/view_home/components/buttons/add_word_button.dart';
import 'package:wordmind/services/fetch_word.dart';
import 'components/buttons/search_button.dart';
import 'components/buttons/setting_button.dart';
import 'components/dialog_widget/dialog_widget.dart';
import 'components/scaffold_body_widget/look_up.dart';
import 'components/textfields/search_textfied.dart';

late Future<WordApi> wordInfo;

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  BannerAd? ad1;
  BannerAd? ad2;
  BannerAd? ad3;
  BannerAd? ad4;
  BannerAd? ad5;
  BannerAd? ad6;

  bool? isLoaded1;
  bool? isLoaded2;
  bool? isLoaded3;
  bool? isLoaded4;
  bool? isLoaded5;
  bool? isLoaded6;

  @override
  void initState() {
    super.initState();
    ad1 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId1,
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => isLoaded1 = true),
        onAdFailedToLoad: (_, error) => print("$error"),
      ),
      request: const AdRequest(),
    );

    // ad2 = BannerAd(
    //   size: AdSize.banner,
    //   adUnitId: AdHelper.bannerAdUnitId2,
    //   listener: BannerAdListener(
    //     onAdLoaded: (_) => setState(() => isLoaded2 = true),
    //     onAdFailedToLoad: (_, error) => print("$error"),
    //   ),
    //   request: const AdRequest(),
    // );

    // ad3 = BannerAd(
    //   size: AdSize.banner,
    //   adUnitId: AdHelper.bannerAdUnitId3,
    //   listener: BannerAdListener(
    //     onAdLoaded: (_) => setState(() => isLoaded3 = true),
    //     onAdFailedToLoad: (_, error) => print("$error"),
    //   ),
    //   request: const AdRequest(),
    // );

    // ad4 = BannerAd(
    //   size: AdSize.banner,
    //   adUnitId: AdHelper.bannerAdUnitId4,
    //   listener: BannerAdListener(
    //     onAdLoaded: (_) => setState(() => isLoaded4 = true),
    //     onAdFailedToLoad: (_, error) => print("$error"),
    //   ),
    //   request: const AdRequest(),
    // );
    // ad5 = BannerAd(
    //   size: AdSize.banner,
    //   adUnitId: AdHelper.bannerAdUnitId5,
    //   listener: BannerAdListener(
    //     onAdLoaded: (_) => setState(() => isLoaded5 = true),
    //     onAdFailedToLoad: (_, error) => print("$error"),
    //   ),
    //   request: const AdRequest(),
    // );
    // ad6 = BannerAd(
    //   size: AdSize.banner,
    //   adUnitId: AdHelper.bannerAdUnitId6,
    //   listener: BannerAdListener(
    //     onAdLoaded: (_) => setState(() => isLoaded6 = true),
    //     onAdFailedToLoad: (_, error) => print("$error"),
    //   ),
    //   request: const AdRequest(),
    // );

    ad1!.load();
    // ad2!.load();
    // ad3!.load();
    // ad4!.load();
    // ad5!.load();
    // ad6!.load();
  }

  @override
  void dispose() {
    ad1?.dispose();
    // ad2?.dispose();
    // ad3?.dispose();
    // ad4?.dispose();
    // ad5?.dispose();
    // ad6?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Row(
                      children: [
                        SettingButton(),
                        AddWordButtonWidget(),
                        Expanded(
                          child: SearchTextWidget(
                            textController: textController.textController,
                          ),
                        ),
                        SearchWordButtonWidget(
                          onPressed: () => {
                            adDialogScreen(
                              isLoaded2,
                              ad2,
                              context,
                            ),
                            wordInfo =
                                fetchWord(textController.textController.text),
                            dialogScreen(wordInfo),
                            textController.textController.clear(),
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 120,
                    child: LookUpScreen(),
                  ),
                  SizedBox(
                    child: Center(
                      child: addTool.checkForAd(isLoaded1, ad1),
                    ),
                    height: 45,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SampleView extends StatelessWidget {
  const SampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
