import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';

class WordOfTheDayView extends StatelessWidget {
  WordOfTheDayView({Key? key}) : super(key: key);
  final dataController = getIt<WordOfTheDayController>.call();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: const Text(KString.wordOfTheDay)),
      body: Builder(
        builder: (context) {
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
