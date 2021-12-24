import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../core/remote/admob/ad_helper.dart';
import '../../../core/remote/api/models/word_model.dart';
import '../../../core/remote/api/viewmodels/word_viewmodels.dart';
import '../../global/components/common/buttons.dart';
import '../../global/components/common/textfields.dart';
import '../../global/controllers/text_editing_controllers.dart';
import '../view_search_result.dart';
import '../view_settings.dart';
import 'components/scaffold_body_widget/look_up.dart';
import 'package:provider/provider.dart';

late Future<WordModel> wordInfo;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final BannerAd _ad1;
  late final BannerAd _ad2;

  bool _isLoad1 = false;
  bool _isLoad2 = false;

  Future<void> _createAd1() async {
    _ad1 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.banner1,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => _isLoad1 = true),
        onAdFailedToLoad: (ad, error) async => await ad.dispose(),
      ),
    );
    await _ad1.load();
  }

  Future<void> _createAd2() async {
    _ad2 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.banner2,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => _isLoad2 = true),
        onAdFailedToLoad: (ad, error) async => await ad.dispose(),
      ),
    );
    await _ad2.load();
  }

  @override
  void initState() {
    super.initState();
    _createAd1();
    _createAd2();
  }

  @override
  void dispose() {
    super.dispose();
    _ad1.dispose();
    _ad2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final WordViewModelAPI _wordViewModel =
        Provider.of<WordViewModelAPI>(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: AdHelper().checkForAd(_isLoad1, _ad1),
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
                          icon: const Icon(Icons.settings),
                          onPressed: () async => Get.to(
                            () => SettingView(
                              ad2: _ad2,
                              isLoaded2: _isLoad2,
                            ),
                          ),
                        ),
                        // CustomIconButton(
                        //   icon: const Icon(Icons.add_chart),
                        //   onPressed: () => Get.to(() => const AddWordView()),
                        // ),
                        Expanded(
                          child: CustomTextField(
                            controller: controllers.search,
                            icon: const Icon(Icons.search),
                            onTap: () => {
                              wordInfo = _wordViewModel
                                  .fetchData(controllers.search.text),
                              Get.to(() => const SearchResultView()),
                              controllers.search.clear(),
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _isLoad1
                        ? MediaQuery.of(context).size.height -
                            _ad1.size.height.toDouble() -
                            75
                        : MediaQuery.of(context).size.height - 75,
                    child: const LookUpScreen(),
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
