import 'package:flutter/material.dart';

import '../../../../core/navigation/contract/base_navigation_service.dart';
import '../../../../global/export/export.dart';

class SearchResultView extends StatelessWidget {
  final searchWordController = SearchController.instance;
  final navigator = getIt<NavigationServiceContract>.call();

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
        onTap: () => navigator.getBack(),
      );

  Widget get _getData => Builder(
        builder: (context) {
          return WordWidget(
            wordModel: searchWordController.getWord,
            controller: searchWordController,
          );

          // switch (searchWordController.getWord.runtimeType) {
          //   case ErrorModel:
          //     final ErrorModel errorModel = searchWordController.getWord;
          //     return MyErrorWidget(
          //       errorModel: ErrorModel(
          //         title: errorModel.title,
          //         message: errorModel.message,
          //       ),
          //     );

          //   case Null:
          //     return const LoadingWidget();

          //   default:
          // }
        },
      );
}
