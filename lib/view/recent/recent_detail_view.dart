import 'package:flutter/material.dart';

import '../../core/components/custom_app_bar.dart';
import '../../core/initialization/injection/injection.dart';
import '../../feature/components/word_widget.dart';
import '../../feature/controller/hive_controller.dart';
import '../../feature/model/word_model.dart';

class RecentDetailWiew extends StatelessWidget {
  const RecentDetailWiew({
    Key? key,
    required this.wordModel,
  }) : super(key: key);
  final WordModel wordModel;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppBar(),
        body: WordWidget(
          controller: Injection.instance.locator.get<HiveController>(),
          wordModel: wordModel,
        ),
      );
}
