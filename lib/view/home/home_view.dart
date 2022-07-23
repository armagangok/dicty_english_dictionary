import 'package:flutter/material.dart';

import '../../core/components/data_loading_widgets.dart';
import '../../feature/components/word_widget.dart';
import '../../feature/export/export.dart';
import 'controller/data_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.dismissKeyboard(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: buildAppBar(context),
          body: Obx(
            () {
              switch (dataController.wordModel.value) {
                case 0:
                  return const NoDataWidget();
                case null:
                  return const WaitingForDataWidget();
                default:
                  return ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      NewWordWidget(
                        wordModel: dataController.wordModel.value,
                        controller: dataController,
                      ),
                    ],
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  //

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Word Of The Day!",
        style: context.textTheme.labelLarge!.copyWith(
            // color: Colors.white,
            // fontWeight: FontWeight.w800,
            fontSize: 20),
      ),
    );
  }
}




            





              // Widget buildtDataWidget() {
  //   return Builder(
  //     builder: (context) {
  //       return ListView(
  //         padding: EdgeInsets.all(context.width(0.025)),
  //         physics: const ClampingScrollPhysics(),
  //         shrinkWrap: true,
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.symmetric(vertical: context.height(0.015)),
  //             child: Center(
  //               child: Text(
  //                 "Word Of The Day!",
  //                 style: context.textTheme.headline5!.copyWith(
  //                   shadows: [
  //                     const Shadow(
  //                       offset: Offset(0, 1),
  //                       blurRadius: 3,
  //                       color: Color.fromARGB(255, 73, 73, 73),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Card(
  //             shape: const RoundedRectangleBorder(
  //               borderRadius: BorderRadius.all(
  //                 Radius.circular(16),
  //               ),
  //             ),
  //             child: Padding(
  //               padding: EdgeInsets.all(context.width(0.02)),
  //               child: WordWidget(wordModel: dataController.wordModel.value!),
  //             ),
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }