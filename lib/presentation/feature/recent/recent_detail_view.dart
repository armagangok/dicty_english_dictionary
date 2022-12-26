import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';
import 'cubit/local/local_cubit.dart';

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
      controller: getIt.call<LocalCubit>(),
      tabCubit: getIt.call<TabCubit>(),
      wordModel: wordModel,
    );
  }

  CustomAppBar _buildAppBar() => CustomAppBar();
}
