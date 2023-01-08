
import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';

class WordWidget extends StatelessWidget {
  const WordWidget({
    Key? key,
    required this.controller,
    required this.wordModel,
    required this.tabCubit,
  }) : super(key: key);

  final WordCubitContract controller;
  final WordModel wordModel;
  final TabCubit tabCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TabCubit, TabState>(
      bloc: tabCubit,
      listener: (context, tabCubit) {},
      builder: (context, tabCubit) {
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
                  expandedItems1(),
                  SizedBox(height: context.height(0.0075)),
                  expandedItems2(),
                  wordKindWidget(tabCubit),
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

  Widget phonetics() => Builder(
        builder: (context) => wordModel.phonetics == null
            ? const SizedBox()
            : ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: context.height(0.035),
                  minHeight: 0,
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: context.lowWidth,
                  ),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: wordModel.phonetics == null
                      ? 0
                      : wordModel.phonetics!.length,
                  itemBuilder: (context, index) =>
                      wordModel.phonetics![index].text == null
                          ? const SizedBox()
                          : Center(
                              child: Text(
                                wordModel.phonetics![index].text ?? "null list",
                                style: context.textTheme.bodyMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                ),
              ),
      );

  //

  Widget wordKindWidget(TabState tabCubit) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          tabCubit.index == 0
              ? DictionaryWidget(
                  definitions: controller.noun,
                )
              : const SizedBox(),
          tabCubit.index == 1
              ? DictionaryWidget(
                  definitions: controller.pronoun,
                )
              : const SizedBox(),
          tabCubit.index == 2
              ? DictionaryWidget(
                  definitions: controller.articles,
                )
              : const SizedBox(),
          tabCubit.index == 3
              ? DictionaryWidget(
                  definitions: controller.interjection,
                )
              : const SizedBox(),
          tabCubit.index == 4
              ? DictionaryWidget(
                  definitions: controller.verb,
                )
              : const SizedBox(),
          tabCubit.index == 5
              ? DictionaryWidget(
                  definitions: controller.adverb,
                )
              : const SizedBox(),
          tabCubit.index == 6
              ? DictionaryWidget(
                  definitions: controller.preposition,
                )
              : const SizedBox(),
          tabCubit.index == 7
              ? DictionaryWidget(
                  definitions: controller.adjective,
                )
              : const SizedBox(),
        ],
      );

  //

  Widget expandedItems2() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExpandedItem(
              text: "Verb",
              clickedNumber: 4,
              onTap: () => tabCubit.changeIndex(4),
              amount: controller.verb.length,
            ),
            ExpandedItem(
              text: "Adverb",
              clickedNumber: 5,
              onTap: () => tabCubit.changeIndex(5),
              amount: controller.adverb.length,
            ),
            ExpandedItem(
              text: "Preposition",
              clickedNumber: 6,
              onTap: () => tabCubit.changeIndex(6),
              amount: controller.preposition.length,
            ),
            ExpandedItem(
              text: "Adjecive",
              clickedNumber: 7,
              onTap: () => tabCubit.changeIndex(7),
              amount: controller.adjective.length,
            ),
          ],
        ),
      );

  //

  Widget expandedItems1() => Builder(
        builder: (context) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ExpandedItem(
                  text: "Noun",
                  clickedNumber: 0,
                  onTap: () => tabCubit.changeIndex(0),
                  amount: controller.noun.length,
                ),
                ExpandedItem(
                  text: "Pronoun",
                  clickedNumber: 1,
                  onTap: () => tabCubit.changeIndex(1),
                  amount: controller.pronoun.length,
                ),
                ExpandedItem(
                  text: "Articles",
                  clickedNumber: 2,
                  onTap: () => tabCubit.changeIndex(2),
                  amount: controller.articles.length,
                ),
                ExpandedItem(
                  text: "Interjection",
                  clickedNumber: 3,
                  onTap: () => tabCubit.changeIndex(3),
                  amount: controller.interjection.length,
                ),
              ],
            ),
          );
        },
      );
}
