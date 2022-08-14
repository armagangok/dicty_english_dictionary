import 'package:flutter/material.dart';

import '../../view/recent/components/speak_button.dart';
import '../controller/tab_controller.dart';
import '../export/export.dart';
import 'dictionary_widget.dart';

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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.bigWidth,
        vertical: context.normalWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          wordTextSpeakButton(),
          const SizedBox001(),
          phonetics(),
          const SizedBox001(),
          expandedItems1(),
          SizedBox(height: context.height(0.0075)),
          expandedItems2(),
          wordKindWidget()
        ],
      ),
    );
  }

  //

  Widget expandedItems2() {
    return SingleChildScrollView(
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
  }

  //

  Widget expandedItems1() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          expandedItem("Noun", 0, () => tabBarController.changeIndex(0),
              controller.noun.length),
          expandedItem("Pronoun", 1, () => tabBarController.changeIndex(1),
              controller.pronoun.length),
          expandedItem("Articles", 2, () => tabBarController.changeIndex(2),
              controller.articles.length),
          expandedItem("Interjection", 3, () => tabBarController.changeIndex(3),
              controller.interjection.length),
        ],
      ),
    );
  }

  Widget wordTextSpeakButton() {
    return Builder(builder: (context) {
      return Row(
        children: [
          Text(
            wordModel.word!,
            style: context.textTheme.headline4!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SpeakButton(data: wordModel.word!)
        ],
      );
    });
  }

  //

  SizedBox phonetics() {
    return SizedBox(
      width: double.infinity,
      height: 18,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: context.lowWidth,
        ),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: wordModel.phonetics!.length,
        itemBuilder: (context, index) {
          return wordModel.phonetics![index].text == null
              ? const SizedBox()
              : Text(
                  wordModel.phonetics![index].text!,
                  style: const TextStyle(color: Colors.blue),
                );
        },
      ),
    );
  }

  //

  Obx wordKindWidget() {
    return Obx(
      () {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox001(),
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
        );
      },
    );
  }

  //

  Widget expandedItem(
    String text,
    int clickedNumber,
    final Function onTap,
    int amount,
  ) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: () => onTap(),
          child: Obx(
            () {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(90),
                  ),
                  color: clickedNumber == tabBarController.currentIndex.value
                      ? Colors.blue
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
                    Text("($amount)")
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
