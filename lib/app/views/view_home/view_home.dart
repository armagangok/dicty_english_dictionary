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
  @override
  void initState() {
    super.initState();
    initAd.ad1 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId1,
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => initAd.isLoaded1 = true),
        onAdFailedToLoad: (_, error) => print("$error"),
      ),
      request: const AdRequest(),
    );

    initAd.ad2 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId2,
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => initAd.isLoaded2 = true),
        onAdFailedToLoad: (_, error) => print("$error"),
      ),
      request: const AdRequest(),
    );

    initAd.ad3 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId3,
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => initAd.isLoaded3 = true),
        onAdFailedToLoad: (_, error) => print("$error"),
      ),
      request: const AdRequest(),
    );

    initAd.ad4 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId4,
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => initAd.isLoaded4 = true),
        onAdFailedToLoad: (_, error) => print("$error"),
      ),
      request: const AdRequest(),
    );
    initAd.ad5 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId5,
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => initAd.isLoaded5 = true),
        onAdFailedToLoad: (_, error) => print("$error"),
      ),
      request: const AdRequest(),
    );
    initAd.ad6 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId6,
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => initAd.isLoaded6 = true),
        onAdFailedToLoad: (_, error) => print("$error"),
      ),
      request: const AdRequest(),
    );

    initAd.ad1!.load();
    initAd.ad2!.load();
    initAd.ad3!.load();
    initAd.ad4!.load();
    initAd.ad5!.load();
    initAd.ad6!.load();
  }

  @override
  void dispose() {
    initAd.ad1?.dispose();
    initAd.ad2?.dispose();
    initAd.ad3?.dispose();
    initAd.ad4?.dispose();
    initAd.ad5?.dispose();
    initAd.ad6?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
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
                                initAd.isLoaded2, initAd.ad2, context),
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
                      child: addTool.checkForAd(initAd.isLoaded1, initAd.ad1),
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
