import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/local/database/services/hive_service.dart';
import '../../../core/remote/api/models/word_model.dart';
import '../../../feature/components/word_widget.dart';
import '../../../feature/export/export.dart';

class RecentItem extends StatelessWidget {
  final WordModel wordModel;

  const RecentItem({
    Key? key,
    required this.wordModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        HiveService.instance.fetchWord(wordModel);
        Get.dialog(buildDialog());
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              "${wordModel.word}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SpeakButton(data: wordModel.word ?? "hello"),
        ],
      ),
    );
  }

  //

  Widget buildDialog() {
    return Builder(
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.7, sigmaY: 0.7),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: FittedBox(
              child: SizedBox(
                height: context.height(0.7),
                width: context.width(1),
                child: ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    NewWordWidget(
                      controller: HiveService.instance,
                      wordModel: wordModel,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SpeakButton extends StatelessWidget {
  const SpeakButton({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width(0.02)),
      child: GestureDetector(
        onTap: () => speakWordOneTime(data),
        child: const Icon(
          CupertinoIcons.speaker_3_fill,
          color: Colors.blue,
          size: 18,
        ),
      ),
    );
  }
}

// dictData(
//   "${data.word}",
//   textColor: Colors.red,
//   size: 25,
//   fWeigth: FontWeight.w700,
// ),
// SizedBox(height: context.height(0.02)),
// dictData(
//   "Meaning ${data.meaning1}",
//   icon: const Icon(Icons.menu_book),
//   fWeigth: FontWeight.w400,
// ),
// SizedBox(height: context.height(0.02)),
// dictData(
//   "${data.meaning2}",
//   icon: const Icon(Icons.menu_book),
//   fWeigth: FontWeight.w400,
// ),
// SizedBox(height: context.height(0.02)),
// dictData(
//   "Origin: " "${data.origin}",
//   icon: const Icon(Icons.trip_origin),
//   fWeigth: FontWeight.w400,
// ),
// SizedBox(height: context.height(0.02)),
// dictData(
//   "${data.example}",
//   icon: const Icon(Icons.star),
//   fWeigth: FontWeight.w400,
// ),
