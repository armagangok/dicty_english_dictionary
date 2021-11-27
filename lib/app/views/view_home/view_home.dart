import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import 'package:wordmind/ads/ad_helper.dart';
import 'package:wordmind/app/components/common/buttons.dart';
import 'package:wordmind/app/components/common/textfields.dart';
import 'package:wordmind/app/controllers/text_editing_controllers.dart';
import 'package:wordmind/app/views/view_settings/settings.dart';
import 'package:wordmind/app/views/view_word_adding/view_add_word.dart';
import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/services/fetch_word.dart';
import 'components/dialog_widget/dialog_widget.dart';
import 'components/scaffold_body_widget/look_up.dart';

late Future<WordApi> wordInfo;

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final BannerAd _bottom;
  late final BannerAd _bottomSetting;

  bool _isBottomBannerLoaded = false;
  bool _isBottomBannerLoadedSetting = false;

  Future<void> _createBottomBannerAd() async {
    _bottom = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bottomBannerId,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => _isBottomBannerLoaded = true),
        onAdFailedToLoad: (ad, error) async => await ad.dispose(),
      ),
    );
    await _bottom.load();
  }

  Future<void> _createBottomBannerAdSetting() async {
    _bottomSetting = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bottomBannerId2,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => _isBottomBannerLoadedSetting = true),
        onAdFailedToLoad: (ad, error) async => await ad.dispose(),
      ),
    );
    await _bottomSetting.load();
  }

  @override
  void initState() {
    super.initState();
    _createBottomBannerAd();
    _createBottomBannerAdSetting();
  }

  @override
  void dispose() {
    super.dispose();
    _bottom.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:
            AdHelper().checkForAd(_isBottomBannerLoaded, _bottom) ??
                Text("Advertisement could not show up."),
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 3,
                    ),
                    child: Row(
                      children: [
                        CustomIconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () async => Get.to(
                            SettingView(
                              accent: await hiveHelper.getLanguage(),
                              bottomBanner: _bottomSetting,
                              isLoaded: _isBottomBannerLoadedSetting,
                            ),
                          ),
                        ),
                        CustomIconButton(
                          icon: Icon(Icons.add_chart),
                          onPressed: () => Get.to(() => AddWordView()),
                        ),
                        Expanded(
                          child: CustomTextField(
                            icon: Icon(Icons.search),
                            onTap: () async => {
                              print(controllers.search),
                              wordInfo = fetchWord(controllers.search.text),
                              dialogScreen(wordInfo, context),
                              controllers.textController.clear(),
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height -
                        75 -
                        _bottom.size.height,
                    child: LookUpScreen(),
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
