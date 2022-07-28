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
                      WordWidget(
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
        style: context.textTheme.labelLarge!.copyWith(fontSize: 20),
      ),
    );
  }
}
