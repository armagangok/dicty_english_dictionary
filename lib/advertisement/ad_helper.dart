import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  
  static String get bannerAdUnitId1 {
    if (Platform.isAndroid) {
      return "ca-app-pub-3284743895748498/2525921604";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3284743895748498/6452207258";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

    static String get bannerAdUnitId2 {
    if (Platform.isAndroid) {
      return "ca-app-pub-3284743895748498/4470053508";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3284743895748498/6452207258";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

    static String get bannerAdUnitId3 {
    if (Platform.isAndroid) {
      return "ca-app-pub-3284743895748498/1841511420";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3284743895748498/6452207258";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

      static String get bannerAdUnitId4 {
    if (Platform.isAndroid) {
      return "ca-app-pub-3284743895748498/8869954202";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3284743895748498/6452207258";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}



final addTool = AddTool();

class AddTool {
  Widget checkForAd(bool? isLoaded, AdWithView? _ad) {
    if (isLoaded == true) {
      return Container(
        child: AdWidget(
          ad: _ad!,
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
