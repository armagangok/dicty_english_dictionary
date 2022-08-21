import 'package:flutter/material.dart';

import '../../core/components/custom_app_bar.dart';
import '../../core/components/error_widget.dart';
import '../../core/components/loading_widget.dart';
import '../../core/remote/api/model/model.dart';
import '../../feature/components/word_widget.dart';
import '../../feature/export/export.dart';

class SearchResultView extends StatelessWidget {
  final TextController textController = Get.find();
  final SearchController searchWordController = Get.find();

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
          searchWordController.clearAllList();
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
