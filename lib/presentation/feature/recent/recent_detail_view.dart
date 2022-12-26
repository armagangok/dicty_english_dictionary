import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';

class RecentDetailWiew extends StatelessWidget {
  const RecentDetailWiew({
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

  WordWidget buildBody() {
    return WordWidget(
      controller: getIt.call<SearchCubit>(),
      wordModel: wordModel,
    );
  }

  CustomAppBar _buildAppBar() => CustomAppBar();
}
