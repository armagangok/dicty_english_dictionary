import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import 'package:wordmind/app/screens/home/home_screen/components/buttons/save_api_data_button.dart';
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
