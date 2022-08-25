import 'package:flutter/material.dart';

import '../../global/export/export.dart';
import 'dictionary_widget.dart';
import 'expanded_item.dart';
import 'speak_button.dart';

class WordWidget extends StatelessWidget {
  WordWidget({
    Key? key,
    required this.controller,
    required this.wordModel,
  }) : super(key: key);

  final BaseWordController controller;
  final WordModel wordModel;
  final tabBarController = TabBarController.instance;

  @override
  Widget build(BuildContext context) {
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
              wordKindWidget(),
            ],
          ),
        )
      ],
    );
  }

  //

  Widget wordTextSpeakButton() => Builder(
        builder: (context) => Container(
          decoration: BoxDecoration(
            gradient: _gradientDecoration,
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
                      wordModel.word!,
                      style: context.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 30,
                          fontStyle: FontStyle.italic),
                      maxLines: 1,
                    ),
                    SpeakButton(data: wordModel.word!),
                  ],
                ),
                phonetics(),
              ],
            ),
          ),
        ),
      );

  LinearGradient get _gradientDecoration => const LinearGradient(
        colors: [
          KColor.primaryColorBright,
          KColor.primaryColor,
        ],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      );

  //

  Widget phonetics() => Builder(
        builder: (context) => wordModel.phonetics!.isEmpty
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
                  itemCount: wordModel.phonetics!.length,
                  itemBuilder: (context, index) =>
                      wordModel.phonetics![index].text == null
                          ? const SizedBox()
                          : Center(
                              child: Text(
                                wordModel.phonetics![index].text!,
                                style: context.textTheme.bodyMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                ),
              ),
      );

  //

  Obx wordKindWidget() => Obx(() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          tabBarController.currentIndex.value == 0
              ? DictionaryWidget(
                  definitions: controller.noun,
                )
              : const SizedBox(),
          tabBarController.currentIndex.value == 1
              ? DictionaryWidget(
                  definitions: controller.pronoun,
                )
              : const SizedBox(),
          tabBarController.currentIndex.value == 2
              ? DictionaryWidget(
                  definitions: controller.articles,
                )
              : const SizedBox(),
          tabBarController.currentIndex.value == 3
              ? DictionaryWidget(
                  definitions: controller.interjection,
                )
              : const SizedBox(),
          tabBarController.currentIndex.value == 4
              ? DictionaryWidget(
                  definitions: controller.verb,
                )
              : const SizedBox(),
          tabBarController.currentIndex.value == 5
              ? DictionaryWidget(
                  definitions: controller.adverb,
                )
              : const SizedBox(),
          tabBarController.currentIndex.value == 6
              ? DictionaryWidget(
                  definitions: controller.preposition,
                )
              : const SizedBox(),
          tabBarController.currentIndex.value == 7
              ? DictionaryWidget(
                  definitions: controller.adjective,
                )
              : const SizedBox(),
        ],
      ));

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
              onTap: () => tabBarController.changeIndex(4),
              amount: controller.verb.length,
            ),
            ExpandedItem(
              text: "Adverb",
              clickedNumber: 5,
              onTap: () => tabBarController.changeIndex(5),
              amount: controller.adverb.length,
            ),
            ExpandedItem(
              text: "Preposition",
              clickedNumber: 6,
              onTap: () => tabBarController.changeIndex(6),
              amount: controller.preposition.length,
            ),
            ExpandedItem(
              text: "Adjecive",
              clickedNumber: 7,
              onTap: () => tabBarController.changeIndex(7),
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
                  onTap: () => tabBarController.changeIndex(0),
                  amount: controller.noun.length,
                ),
                ExpandedItem(
                  text: "Pronoun",
                  clickedNumber: 1,
                  onTap: () => tabBarController.changeIndex(1),
                  amount: controller.pronoun.length,
                ),
                ExpandedItem(
                  text: "Articles",
                  clickedNumber: 2,
                  onTap: () => tabBarController.changeIndex(2),
                  amount: controller.articles.length,
                ),
                ExpandedItem(
                  text: "Interjection",
                  clickedNumber: 3,
                  onTap: () => tabBarController.changeIndex(3),
                  amount: controller.interjection.length,
                ),
              ],
            ),
          );
        },
      );
}
