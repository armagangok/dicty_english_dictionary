import 'package:flutter/material.dart';

import '../../core/remote/api/controller/base_word_controller.dart';
import '../../core/remote/api/models/word_model.dart';
import '../controller/tab_controller.dart';
import '../export/export.dart';
import 'dictionary_widget.dart';

class NewWordWidget extends StatelessWidget {
  NewWordWidget({
    Key? key,
    required this.controller,
    required this.wordModel,
  }) : super(key: key);

  final BaseWordController controller;
  final TabBarController tabBarController = Get.put(TabBarController());
  final WordModel wordModel;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    return Builder(
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.height(0.025),
            vertical: context.height(0.025),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                wordModel.word!,
                style: context.textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "/həˈləʊ/",
                    style: TextStyle(color: Colors.blue),
                  ),
                  const Text(
                    "/həˈləʊ/",
                    style: TextStyle(color: Colors.blue),
                  ),
                  SpeakButton(data: wordModel.word!),
                ],
              ),
              const SizedBox001(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Row(
                    // scrollDirection: Axis.horizontal,

                    mainAxisSize: MainAxisSize.min,
                    children: [
                      expandedItem(
                        "Noun",
                        0,
                        () => tabBarController.changeIndex(0),
                      ),
                      expandedItem(
                        "Pronoun",
                        1,
                        () => tabBarController.changeIndex(1),
                      ),
                      expandedItem(
                        "Articles",
                        2,
                        () => tabBarController.changeIndex(2),
                      ),
                      expandedItem(
                        "Interjection",
                        3,
                        () => tabBarController.changeIndex(3),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.height(0.0075),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      expandedItem(
                        "Verb",
                        4,
                        () => tabBarController.changeIndex(4),
                      ),
                      expandedItem(
                        "Adverb",
                        5,
                        () => tabBarController.changeIndex(5),
                      ),
                      expandedItem(
                        "Preposition",
                        6,
                        () => tabBarController.changeIndex(6),
                      ),
                      expandedItem(
                        "Adjecive",
                        7,
                        () => tabBarController.changeIndex(7),
                      ),
                    ],
                  ),
                ),
              ),
              wordKindWidget()
            ],
          ),
        );
      },
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
                    definitions: controller.noun!,
                  )
                : const SizedBox(),
            tabBarController.currentIndex.value == 1
                ? DictionaryWidget(
                    definitions: controller.pronoun!,
                  )
                : const SizedBox(),
            tabBarController.currentIndex.value == 2
                ? DictionaryWidget(
                    definitions: controller.articles!,
                  )
                : const SizedBox(),
            tabBarController.currentIndex.value == 3
                ? DictionaryWidget(
                    definitions: controller.interjection!,
                  )
                : const SizedBox(),
            tabBarController.currentIndex.value == 4
                ? DictionaryWidget(
                    definitions: controller.verb!,
                  )
                : const SizedBox(),
            tabBarController.currentIndex.value == 5
                ? DictionaryWidget(
                    definitions: controller.adverb!,
                  )
                : const SizedBox(),
            tabBarController.currentIndex.value == 6
                ? DictionaryWidget(
                    definitions: controller.preposition!,
                  )
                : const SizedBox(),
            tabBarController.currentIndex.value == 7
                ? DictionaryWidget(
                    definitions: controller.adjective!,
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
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                  color: clickedNumber == tabBarController.currentIndex.value
                      ? Colors.blue
                      : Colors.transparent,
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: context.width(0.01),
                    vertical: context.width(0.006)),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    color: clickedNumber == tabBarController.currentIndex.value
                        ? Colors.white
                        : const Color.fromARGB(255, 0, 153, 255),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}




// Widget waitingForDataWidget() {
//     return Builder(builder: (context) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FittedBox(
//               child: Text(
//                 "Fetching data from source...",
//                 style: context.textTheme.headline6,
//                 maxLines: 1,
//               ),
//             ),
//             // const SizedBox001(),
//             // const CircularProgressIndicator()
//           ],
//         ),
//       );
//     });
//   }

//   //

//   Center noDataWidget() {
//     return const Center(
//       child: Text("An error occured while fetching data."),
//     );
//   }