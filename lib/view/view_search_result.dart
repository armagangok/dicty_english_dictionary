import 'package:flutter/material.dart';

import '../core/remote/admob/ad_helper.dart';
import '../core/remote/admob/generate_ad.dart';
import '../feature/components/common/ad_widget.dart';
import './home/components/stacks/future_builder_widget.dart';

late Future<dynamic> wordInfo;

class SearchResultView extends StatelessWidget {
  const SearchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AdvertisementWidget(
        ad: generateAd.ad,
        unitID: adHelper.bannerAdUnitId3,
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            FutureBuilderWidget(),
          ],
        ),
      ),
    );
  }
}
