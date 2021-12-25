import 'package:google_mobile_ads/google_mobile_ads.dart';

final CreateAd createAd = CreateAd();

class CreateAd {
  BannerAd? ad;
  bool isLoad = false;
  Function? f;

  set boolean(bool newVal) => isLoad = newVal;

  get getbool => isLoad;
  get ad1 => ad;

  Future<void> createAd1(f, {required String unitID}) async {
    ad = BannerAd(
      size: AdSize.banner,
      adUnitId: unitID,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => f(),
        onAdFailedToLoad: (ad, error) async => await ad.dispose(),
      ),
    );
    await ad1.load();
  }
}
