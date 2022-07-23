import 'package:flutter/material.dart';

import '../../../feature/export/export.dart';

const int _maxFailedLoadAttempts = 3;

class IntAdWiew extends StatefulWidget {
  const IntAdWiew({Key? key}) : super(key: key);

  @override
  State<IntAdWiew> createState() => _IntAdWiewState();
}

class _IntAdWiewState extends State<IntAdWiew> {
  int _interstitialLoadAttempts = 0;
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _createInterstitialAd();
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () async {
          await _showInterstitialAd();
        },
        child: const Center(
          child: Text("Press for advertisement."),
        ),
      ),
    );
  }

  //

  void _createInterstitialAd() async {
    await InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _interstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_interstitialLoadAttempts <= _maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
      ),
    );
  }

  //

  Future<void> _showInterstitialAd() async {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        _createInterstitialAd();
        Get.to(RootView());
      }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        _createInterstitialAd();
        Get.to(RootView());
      });

      await _interstitialAd!.show();
    }
  }
}
