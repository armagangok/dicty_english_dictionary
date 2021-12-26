import 'package:english_accent_dictionary/app/global/components/common/ad_widget.dart';
import 'package:english_accent_dictionary/core/remote/admob/ad_helper.dart';
import 'package:english_accent_dictionary/core/remote/admob/generate_ad.dart';
import 'package:flutter/material.dart';
import 'home/components/stacks/future_builder_widget.dart';

late Future<dynamic> wordInfo;

class SearchResultView extends StatelessWidget {
  const SearchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AdvertisementWidget(
        ad: createAd.ad,
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
