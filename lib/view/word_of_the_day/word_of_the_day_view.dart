import 'package:flutter/material.dart';

import '../../core/components/custom_app_bar.dart';
import '../../core/components/error_widget.dart';
import '../../core/components/loading_widget.dart';
import '../../core/remote/api/model/model.dart';
import '../../feature/components/word_widget.dart';
import '../../feature/export/export.dart';
import 'controller/word_of_the_day_controller.dart';

class WordOfTheDayView extends StatelessWidget {
  const WordOfTheDayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final WordOfTheDayController dataController =
        Get.put(WordOfTheDayController.instance);
    return Scaffold(
      appBar: const CustomAppBar(title: Text("Word Of The Day")),
      body: Obx(
        () {
          switch (dataController.wordModel.runtimeType) {
            case ErrorModel:
              final ErrorModel errorModel = dataController.wordModel;
              return MyErrorWidget(
                errorModel: ErrorModel(
                  title: errorModel.title,
                  message: errorModel.message,
                ),
              );
            case Null:
              return const LoadingWidget();

            default:
              return WordWidget(
                wordModel: dataController.wordModel,
                controller: dataController,
              );
          }
        },
      ),
    );
  }
}

