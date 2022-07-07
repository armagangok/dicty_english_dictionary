import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/local/database/viewmodels/word_viewmodel.dart';
import '../../../../../core/local/tts_helper/text_to_speech_helper.dart';
import '../../../../feature/navigation/navigation.dart';

import '../../../view_word_details.dart';
import 'slide_action_widgets.dart';
import 'list_tile_widget.dart';

class LookUpWidget extends StatelessWidget {
  const LookUpWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final WordViewModel _wordViewModel = WordViewModel();
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box("words").listenable(),
        builder: (context, Box wordBox, _) {
          return ListView.builder(
            itemCount: wordBox.length,
            itemBuilder: (context, index) {
              final data = _wordViewModel.getData(index);
              return Slidable(
                actionPane: const SlidableScrollActionPane(),
                actionExtentRatio: 0.18,
                actions: <Widget>[
                  SlideActionWidget(
                    data: data,
                    icon: Icons.record_voice_over,
                    iconText: "Speak",
                    bgColor: Colors.blue,
                    onTap: () async => await speakWord(data, context),
                  ),
                  SlideActionWidget(
                    bgColor: Colors.red,
                    icon: Icons.delete,
                    iconText: "Delete",
                    onTap: () async => await _wordViewModel.deleteData(index),
                  ),
                ],
                secondaryActions: <Widget>[
                  SlideActionWidget(
                    onTap: () => navigate(DetailsView(data: data), context),
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
