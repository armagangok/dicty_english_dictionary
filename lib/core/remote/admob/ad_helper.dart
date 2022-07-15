import 'dart:io';

class AdHelper {
  AdHelper._();

  // static String get bannerAdUnitId1 {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-7691613791089480/2780704918";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/2934735716";
  //   } else {
  //     throw UnsupportedError("Unsupported platform");
  //   }
  // }

  // static String get bannerAdUnitId2 {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-7691613791089480/5215296563";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/2934735716";
  //   } else {
  //     throw UnsupportedError("Unsupported platform");
  //   }
  // }

  // static String get bannerAdUnitId3 {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-7691613791089480/3311277245";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/2934735716";
  //   } else {
  //     throw UnsupportedError("Unsupported platform");
  //   }
  // }

  // static String get bannerAdUnitId4 {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-7691613791089480/5648476609";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/2934735716";
  //   } else {
  //     throw UnsupportedError("Unsupported platform");
  //   }
  // }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7691613791089480/8768062873";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/5135589807";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
