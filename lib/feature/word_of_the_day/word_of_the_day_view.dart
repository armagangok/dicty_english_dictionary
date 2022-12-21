import 'package:english_accent_dictionary/feature/word_of_the_day/cubit/word_of_the_day_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global/export/export.dart';
import 'controller/word_of_the_day_controller.dart';

class WordOfTheDayView extends StatefulWidget {
  const WordOfTheDayView({Key? key}) : super(key: key);

  @override
  State<WordOfTheDayView> createState() => _WordOfTheDayViewState();
}

class _WordOfTheDayViewState extends State<WordOfTheDayView> {
  late final WordOfTheDayController dataController;

  @override
  void initState() {
    dataController = getIt<WordOfTheDayController>.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: const Text(KString.wordOfTheDay)),
      body: BlocConsumer<WordOfTheDayCubit, WordOfTheDayState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Builder(
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
          );
        },
      ),
    );
  }

  Widget errorWidget(ErrorModel errorModel) => MyErrorWidget(
        errorModel:
            ErrorModel(title: errorModel.title, message: errorModel.message),
      );
}
