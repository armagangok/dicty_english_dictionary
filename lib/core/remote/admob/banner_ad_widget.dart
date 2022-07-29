import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../core/remote/admob/generate_ad.dart';

class BannerAdWidget extends StatefulWidget {
  final BannerAd? ad;
  final String? unitID;
  const BannerAdWidget({
    Key? key,
    this.ad,
    this.unitID,
  }) : super(key: key);
  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  @override
  void initState() {
    super.initState();
    generateAd.createAd1(
      () {
        setState(() => generateAd.boolean = true);
      },
      unitID: widget.unitID!,
    );
  }

  @override
  void dispose() {
    super.dispose();

    generateAd.ad1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return checkForAd(generateAd.getbool, generateAd.ad1, context);
  }

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
}
