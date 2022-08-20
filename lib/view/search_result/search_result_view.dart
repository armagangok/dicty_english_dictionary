import 'package:flutter/material.dart';

import '../../core/components/data_loading_widgets.dart';
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
          appBar: AppBar(
            title: const Text("Result"),
          ),
          body: getData(),
        ),
      );

  Widget getData() => Obx(
        () {
          switch (searchWordController.getWord.runtimeType) {
            case ErrorModel:
              final ErrorModel errorModel = searchWordController.getWord;
              return NoDataWidget(
                errorModel: ErrorModel(
                  title: errorModel.title,
                  message: errorModel.message,
                ),
              );

            case Null:
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Waiting for the data..."),
                  CircularProgressIndicator(),
                ],
              ));

            default:
              return WordWidget(
                wordModel: searchWordController.getWord,
                controller: searchWordController,
              );
          }
        },
      );
}
