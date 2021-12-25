import 'package:english_accent_dictionary/core/remote/admob/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final GenerateAd generateAd = GenerateAd();

class GenerateAd {
  late final BannerAd _ad1;
  bool _isLoad1 = false;
  late Function f;

  set boolean(bool newVal) => _isLoad1 = newVal;
  get getbool => _isLoad1;
  get ad1 => _ad1;

  Future<void> createAd(f) async {
    _ad1 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.banner1,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => f(),
        onAdFailedToLoad: (ad, error) async => await ad.dispose(),
      ),
    );
    await ad1.load();
  }
}