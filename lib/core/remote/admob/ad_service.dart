import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Widget checkForAd(bool? isLoaded, BannerAd? ad, context) {
  if (isLoaded == true) {
    return SizedBox(
      height: 54,
      width: MediaQuery.of(context).size.longestSide,
      child: AdWidget(ad: ad!),
    );
  } else {
    return const SizedBox();
  }
}
