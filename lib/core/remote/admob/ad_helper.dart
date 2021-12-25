import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

AdHelper adHelper = AdHelper();

final AdHelper admobHelper = AdHelper();

class AdHelper {
  String get bannerAdUnitId1 {
    if (Platform.isAndroid) {
      return "ca-app-pub-7691613791089480/2780704918";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/2934735716";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  String get bannerAdUnitId2 {
    if (Platform.isAndroid) {
      return "ca-app-pub-7691613791089480~4093786584";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/2934735716";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  String get bannerAdUnitId3 {
    if (Platform.isAndroid) {
      return "ca-app-pub-7691613791089480~4093786584";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/2934735716";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  Widget checkForAd(
    bool? isLoaded,
    BannerAd? ad,
    context,
  ) {
    if (isLoaded == true) {
      return SizedBox(
        height: 35,
        width: MediaQuery.of(context).size.longestSide,
        child: AdWidget(ad: ad!),
      );
    } else {
      return const SizedBox();
    }
  }
}


// String get banner1 {
//   if (Platform.isAndroid) {
//     return "ca-app-pub-3940256099942544/6300978111";
//   } else if (Platform.isIOS) {
//     return "ca-app-pub-3940256099942544/2934735716";
//   } else {
//     throw UnsupportedError("Unsupported platform");
//   }
  // Future<void> _createBottomBannerAd(func) async {
  //   _bottom = BannerAd(
  //     size: AdSize.banner,
  //     adUnitId: AdHelper.bottomBannerId,
  //     request: AdRequest(),
  //     listener: BannerAdListener(
  //       onAdLoaded: (_) => func(),
  //       onAdFailedToLoad: (ad, error) async => await ad.dispose(),
  //     ),
  //   );
  //   await _bottom.load();
  // }
  // static String get interstitialAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-3940256099942544/8691691433";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/5135589807";
  //   } else {
  //     throw new UnsupportedError("Unsupported platform");
  //   }
  // }
// }
