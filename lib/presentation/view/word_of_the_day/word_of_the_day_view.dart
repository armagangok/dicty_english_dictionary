import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../../global/export/export.dart';

class WordOfTheDayView extends StatelessWidget {
  WordOfTheDayView({Key? key}) : super(key: key);
  final dataController = Get.put(WordOfTheDayController.instance);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text(KString.wordOfTheDay)),
      body: Obx(
        () {
          switch (dataController.wordModel.runtimeType) {
            case ErrorModel:
              final ErrorModel errorModel = dataController.wordModel;
              return errorWidget(errorModel);
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

  Widget errorWidget(ErrorModel errorModel) => MyErrorWidget(
        errorModel:
            ErrorModel(title: errorModel.title, message: errorModel.message),
      );
}
