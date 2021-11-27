import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import 'package:wordmind/app/components/common/buttons.dart';
import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/database/word_hive_model.dart';
import '../scaffold_body_widget/widgets/future_builder_widget.dart';

void dialogScreen(Future<WordApi> wordInfo, context) {
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
            CustomElevatedButton(
              text: "save",
              buttonH: 30,
              buttonW: MediaQuery.of(context).size.height,
              onPressed: () async {
                print(wordInfo);
                WordApi data = await wordInfo;
                Word data1 = Word(
                  word: data.word,
                  origin: data.origin,
                  meaning1: data.meaning1,
                  meaning2: data.meaning2,
                  example: data.example,
                );
                await hiveHelper.addData(data1);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
