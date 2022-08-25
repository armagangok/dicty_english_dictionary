import 'package:flutter/material.dart';

import '../../global/export/export.dart';

class SearchResultView extends StatelessWidget {
  final searchWordController = SearchController.instance;

  SearchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => context.dismissKeyboard(),
        child: Scaffold(
          appBar: _buildAppBar,
          body: _getData,
        ),
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: const Text("Result"),
        onTap: () {
          Get.back();
        },
      );

  Widget get _getData => Obx(
        () {
          switch (searchWordController.getWord.runtimeType) {
            case ErrorModel:
              final ErrorModel errorModel = searchWordController.getWord;
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
                wordModel: searchWordController.getWord,
                controller: searchWordController,
              );
          }
        },
      );
}
