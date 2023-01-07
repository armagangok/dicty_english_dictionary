import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';

class RecentDetailPage extends StatelessWidget {
  const RecentDetailPage({
    Key? key,
    required this.wordModel,
  }) : super(key: key);

  final WordModel wordModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() => WordWidget(
        controller: getIt.call<LocalCubit>(),
        tabCubit: getIt.call<TabCubit>(),
        wordModel: wordModel,
      );

  CustomAppBar _buildAppBar() => CustomAppBar();
}
