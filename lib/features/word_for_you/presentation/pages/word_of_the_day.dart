import 'package:flutter/material.dart';

import '../../../../../global/export/export.dart';

class WordOfDayPage extends StatefulWidget {
  const WordOfDayPage({Key? key}) : super(key: key);

  @override
  State<WordOfDayPage> createState() => _WordOfDayPageState();
}

class _WordOfDayPageState extends State<WordOfDayPage> {
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
              cubit: wordOfTheDayCubit,
              tabCubit: getIt.call<TabCubit>(),
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
