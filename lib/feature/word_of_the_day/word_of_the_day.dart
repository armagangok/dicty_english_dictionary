import 'package:english_accent_dictionary/feature/word_of_the_day/cubit/word_of_the_day_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global/export/export.dart';

class WordOfDayView extends StatefulWidget {
  const WordOfDayView({Key? key}) : super(key: key);

  @override
  State<WordOfDayView> createState() => _WordOfDayViewState();
}

class _WordOfDayViewState extends State<WordOfDayView> {
  late final WordOfTheDayCubit wordOfTheDayCubit;

  @override
  void initState() {
    wordOfTheDayCubit = getIt.call<WordOfTheDayCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: const Text(KString.wordOfTheDay)),
      body: BlocConsumer<WordOfTheDayCubit, WordOfTheDayState>(
        bloc: wordOfTheDayCubit,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is WordOfTheDayInitial) {
            return const Text("data");
          } else if (state is WordOfTheDayFetchingState) {
            return const LoadingWidget();
          } else if (state is WordOfTheDayFailed) {
            final ErrorModel errorModel = ErrorModel(
              title: state.errorTitle,
              message: state.errorMessage,
            );
            return errorWidget(errorModel);
          } else if (state is WordOfTheDaySucceded) {
            return WordWidget(
              wordModel: state.wordModel,
              controller: wordOfTheDayCubit,
            );
          } else {
            return const Center(
              child: Text("Else"),
            );
          }
        },
      ),
    );
  }

  Widget errorWidget(ErrorModel errorModel) => MyErrorWidget(
        errorModel: errorModel,
      );
}
