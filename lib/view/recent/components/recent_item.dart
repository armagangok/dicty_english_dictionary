import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/local/database/services/hive_service.dart';
import '../../../core/remote/api/models/word_model.dart';
import '../../../feature/components/word_widget.dart';
import '../../../feature/export/export.dart';
import 'delete_button.dart';
import 'speak_button.dart';

class RecentItem extends StatelessWidget {
  final WordModel wordModel;
  final int index;

  const RecentItem({
    Key? key,
    required this.wordModel,
    required this.index,
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
          SpeakButton(data: wordModel.word ?? "No data"),
          Expanded(
            child: Text(
              "${wordModel.word}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DeleteButton(index: index),
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
                    WordWidget(
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
