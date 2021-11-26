import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import 'package:wordmind/app/views/view_home/components/buttons/save_api_data_button.dart';
import '../scaffold_body_widget/widgets/future_builder_widget.dart';

void dialogScreen(Future<WordApi> wordInfo) {
  Get.defaultDialog(
    title: "",
    content: SizedBox(
      height: Get.height / 2,
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilderWidget(wordInfo: wordInfo),
            SaveButton(),
          ],
        ),
      ),
    ),
  );
}


