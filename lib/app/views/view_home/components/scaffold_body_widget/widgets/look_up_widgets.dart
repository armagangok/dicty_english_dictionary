import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/route_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:wordmind/app/views/view_home/components/scaffold_body_widget/widgets/list_tile_widget.dart';
import 'package:wordmind/app/views/view_home/components/stacks/slide_action_widgets.dart';
import 'package:wordmind/app/views/view_word_details/word_details_view.dart';
import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/database/word_hive_model.dart';
import 'package:wordmind/tts_helper/text_to_speech_helper.dart';

class LookUpWidget extends StatelessWidget {
  final BannerAd? bannerAd6;
  final bool? isLoaded6;
  const LookUpWidget({
    Key? key,
    this.bannerAd6,
    this.isLoaded6,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box("words").listenable(),
        builder: (context, Box wordBox, _) {
          return ListView.builder(
            itemCount: wordBox.length,
            // separatorBuilder: (context, index) => Divider(thickness: 0.3),
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
