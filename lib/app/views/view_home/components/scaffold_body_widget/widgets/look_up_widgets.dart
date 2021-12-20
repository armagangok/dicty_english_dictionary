import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/route_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../../core/database/hive_helper.dart';
import '../../../../../../core/database/word_hive_model.dart';
import '../../../../../../core/tts_helper/text_to_speech_helper.dart';
import '../../../../view_word_details.dart';
import '../../stacks/slide_action_widgets.dart';
import 'list_tile_widget.dart';


class LookUpWidget extends StatelessWidget {
  const LookUpWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box("words").listenable(),
        builder: (context, Box wordBox, _) {
          return ListView.builder(
            itemCount: wordBox.length,
            itemBuilder: (context, index) {
              final data = wordBox.getAt(index) as Word;
              return Slidable(
                actionPane: const SlidableScrollActionPane(),
                actionExtentRatio: 0.18,
                actions: <Widget>[
                  SlideActionWidget(
                    data: data,
                    icon: Icons.record_voice_over,
                    iconText: "Speak",
                    bgColor: Colors.blue,
                    onTap: () async => await speakWord(data),
                  ),
                  SlideActionWidget(
                    bgColor: Colors.red,
                    icon: Icons.delete,
                    iconText: "Delete",
                    onTap: () async => await hiveHelper.deleteData(index),
                  ),
                ],
                secondaryActions: <Widget>[
                  SlideActionWidget(
                    onTap: () => Get.to(() => DetailsView(data: data)),
                    icon: Icons.info,
                    iconText: "Details",
                    bgColor: Colors.green,
                  ),
                ],
                child: ListTileItem(data: data, index: index),
              );
            },
          );
        },
      ),
    );
  }
}
