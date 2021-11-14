import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import 'package:wordmind/advertisement/ad_helper.dart';
import 'package:wordmind/app/views/view_home/components/buttons/save_api_data_button.dart';
import '../../widgets/future_builder_widget.dart';

void dialogScreen(Future<WordApi> wordInfo) {
  Get.defaultDialog(
    title: "",
    content: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilderWidget(wordInfo: wordInfo),
            SaveButton(),
          ],
        ),
      ),
    ),
  );
}

void adDialogScreen(bool? isLoaded, BannerAd? _ad2) {
  Get.defaultDialog(
    title: "Advertise",
    content: Column(
      children: [
        SizedBox(
          height: 60,
          child: addTool.checkForAd(isLoaded, _ad2),
        ),
      ],
    ),
  );
}
