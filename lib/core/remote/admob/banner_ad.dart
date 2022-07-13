import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../core/remote/admob/ad_service.dart';
import '../../../../core/remote/admob/generate_ad.dart';

class AdvertisementWidget extends StatefulWidget {
  final BannerAd? ad;
  final String? unitID;
  const AdvertisementWidget({
    Key? key,
    this.ad,
    this.unitID,
  }) : super(key: key);
  @override
  State<AdvertisementWidget> createState() => _AdvertisementWidgetState();
}

class _AdvertisementWidgetState extends State<AdvertisementWidget> {
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
}
