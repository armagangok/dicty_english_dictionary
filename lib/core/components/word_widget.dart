import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';

class WordWidget extends StatelessWidget {
  const WordWidget({
    Key? key,
    required this.cubit,
    required this.wordModel,
    required this.tabCubit,
  }) : super(key: key);

  final WordCubitContract cubit;
  final WordResponse wordModel;
  final TabCubit tabCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, TabState>(
      bloc: tabCubit,
      builder: (context, tabState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            wordTextSpeakButton(),
            Expanded(
              child: ListView(
                padding: context.mediumPadding,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ExpandedItemWidget1(
                    tabCubit: tabCubit,
                    controller: cubit,
                  ),
                  SizedBox(height: context.height(0.0075)),
                  ExpandedItem2(
                    tabCubit: tabCubit,
                    cubit: cubit,
                  ),
                  WordKindWidget(cubit: cubit),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  //

  Widget wordTextSpeakButton() => Builder(
        builder: (context) => Container(
          decoration: BoxDecoration(
            gradient: gradientDecoration,
          ),
          child: SizedBox(
            height: context.height(0.15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      wordModel.word ?? "null word",
                      style: context.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 30,
                          fontStyle: FontStyle.italic),
                      maxLines: 1,
                    ),
                    SpeakButton(data: wordModel.word ?? "null word"),
                  ],
                ),
                phonetics(),
              ],
            ),
          ),
        ),
      );

  //

  Widget phonetics() => PhoneticsWidget(wordModel: wordModel);

  //

}
