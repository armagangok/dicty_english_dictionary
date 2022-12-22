import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';
import '../search_result/cubit/search_cubit.dart';

class RecentDetailWiew extends StatelessWidget {
  const RecentDetailWiew({
    Key? key,
    required this.wordModel,
  }) : super(key: key);
  final WordModel wordModel;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CustomAppBar(),
        body: WordWidget(
          controller: getIt.call<SearchCubit>(),
          wordModel: wordModel,
        ),
      );
}
