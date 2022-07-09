import 'package:flutter/material.dart';

import '../../../feature/export/export.dart';

class LookUpWidget extends StatelessWidget {
  const LookUpWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final WordViewModel _wordViewModel = Get.put(WordViewModel());
    return ValueListenableBuilder(
      valueListenable: Hive.box("words").listenable(),
      builder: (context, Box wordBox, _) {
        return ListView.builder(
          padding: EdgeInsets.all(context.width(0.025)),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: wordBox.length,
          itemBuilder: (context, index) {
            final data = _wordViewModel.getData(index);
            return Slidable(
              actionPane: const SlidableScrollActionPane(),
              actionExtentRatio: 0.18,
              actions: <Widget>[
                SlideActionWidget(
                  data: data,
                  icon: CupertinoIcons.speaker_3_fill,
                  iconText: "Speak",
                  bgColor: Colors.blue,
                  onTap: () async => await speakWord(data, context),
                ),
                SlideActionWidget(
                  bgColor: Colors.red,
                  icon: CupertinoIcons.trash,
                  iconText: "Delete",
                  onTap: () async => await _wordViewModel.deleteData(index),
                ),
              ],
              // secondaryActions: <Widget>[
              //   SlideActionWidget(
              //     onTap: () => Get.to(DetailsView(data: data)),
              //     icon: Icons.info,
              //     iconText: "Details",
              //     bgColor: Colors.green,
              //   ),
              // ],
              child: ListTileItem(data: data, index: index),
            );
          },
        );
      },
    );
  }
}
