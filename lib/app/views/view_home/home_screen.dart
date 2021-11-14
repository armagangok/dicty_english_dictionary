import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import 'package:wordmind/advertisement/ad_helper.dart';
import 'package:wordmind/app/controllers/text_editing_controllers.dart';
import 'package:wordmind/services/fetch_word.dart';
import 'components/buttons/floating_action_button.dart';
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
  BannerAd? _ad1;
  BannerAd? _ad2;
  BannerAd? _ad3;
  BannerAd? _ad4;
  bool? isLoaded1;
  bool? isLoaded2;
  bool? isLoaded3;
  bool? isLoaded4;

  @override
  void initState() {
    super.initState();
    _ad1 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId1,
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => isLoaded1 = true),
        onAdFailedToLoad: (_, error) => print("$error"),
      ),
      request: const AdRequest(),
    );

    _ad2 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId2,
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => isLoaded2 = true),
        onAdFailedToLoad: (_, error) => print("$error"),
      ),
      request: const AdRequest(),
    );

    _ad3 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId3,
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => isLoaded3 = true),
        onAdFailedToLoad: (_, error) => print("$error"),
      ),
      request: const AdRequest(),
    );

    _ad4 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId3,
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => isLoaded4 = true),
        onAdFailedToLoad: (_, error) => print("$error"),
      ),
      request: const AdRequest(),
    );

    _ad1!.load();
    _ad2!.load();
    _ad3!.load();
    _ad4!.load();
  }

  @override
  void dispose() {
    _ad1?.dispose();
    _ad2?.dispose();
    _ad3?.dispose();
    _ad4?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GestureDetector(
            child: Column(
              children: [
                Container(
                  color: Colors.grey,
                  child: Center(
                    child: addTool.checkForAd(isLoaded1, _ad1),
                  ),
                  height: 75,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      SettingButton(
                        isLoaded3: isLoaded3,
                        isLoaded4: isLoaded4,
                        ad3: _ad3,
                        ad4: _ad4,
                      ),
                      Expanded(
                        child: SearchTextWidget(
                          textController: textController.textController,
                        ),
                      ),
                      SearchWordButtonWidget(
                        onPressed: () => {
                          adDialogScreen(isLoaded2, _ad2),
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
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: LookUpScreen(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButtonWidget(),
      ),
    );
  }
}
