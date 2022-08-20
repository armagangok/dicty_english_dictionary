import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../global/constant/app_color/app_color.dart';
import '../controller/tab_controller.dart';
import '../export/export.dart';
import 'dictionary_widget.dart';
import 'speak_button.dart';

class WordWidget extends StatelessWidget {
  WordWidget({
    Key? key,
    required this.controller,
    required this.wordModel,
  }) : super(key: key);

  final BaseWordController controller;
  final TabBarController tabBarController = Get.put(TabBarController());
  final WordModel wordModel;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          wordTextSpeakButton(),
          Expanded(
            child: ListView(
              padding: context.symmetricPadding(horizontal: 0.025),
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

  //

  Widget expandedItems2() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            expandedItem(
              "Verb",
              4,
              () => tabBarController.changeIndex(4),
              controller.verb.length,
            ),
            expandedItem(
              "Adverb",
              5,
              () => tabBarController.changeIndex(5),
              controller.adverb.length,
            ),
            expandedItem(
              "Preposition",
              6,
              () => tabBarController.changeIndex(6),
              controller.preposition.length,
            ),
            expandedItem(
              "Adjecive",
              7,
              () => tabBarController.changeIndex(7),
              controller.adjective.length,
            ),
          ],
        ),
      );

  //

  Widget expandedItems1() => Builder(builder: (context) {
        return Padding(
          padding: EdgeInsets.only(top: context.normalHeight),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                expandedItem(
                  "Noun",
                  0,
                  () => tabBarController.changeIndex(0),
                  controller.noun.length,
                ),
                expandedItem(
                  "Pronoun",
                  1,
                  () => tabBarController.changeIndex(1),
                  controller.pronoun.length,
                ),
                expandedItem(
                  "Articles",
                  2,
                  () => tabBarController.changeIndex(2),
                  controller.articles.length,
                ),
                expandedItem(
                  "Interjection",
                  3,
                  () => tabBarController.changeIndex(3),
                  controller.interjection.length,
                ),
              ],
            ),
          ),
        );
      });

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
          AppColor.primaryColorBright,
          AppColor.primaryColor,
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

  Obx wordKindWidget() => Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(height: context.lowHeight),
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
        ),
      );

  //

  Widget expandedItem(
    String text,
    int clickedNumber,
    final Function onTap,
    int amount,
  ) =>
      Builder(
        builder: (context) => InkWell(
          onTap: () => onTap(),
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.myBlue,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(90),
                ),
                color: clickedNumber == tabBarController.currentIndex.value
                    ? AppColor.myBlue
                    : Colors.transparent,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: context.width(0.01),
                  vertical: context.height(0.006)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      color:
                          clickedNumber == tabBarController.currentIndex.value
                              ? Colors.white
                              : null,
                    ),
                  ),
                  Text(
                    "($amount)",
                    style: TextStyle(
                      color:
                          clickedNumber == tabBarController.currentIndex.value
                              ? Colors.white
                              : null,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
