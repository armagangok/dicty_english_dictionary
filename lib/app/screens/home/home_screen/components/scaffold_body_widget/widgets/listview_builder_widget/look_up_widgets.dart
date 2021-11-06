import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wordmind/app/screens/home/home_screen/components/slide_action_widgets/delete_slide_action_widget.dart';
import 'package:wordmind/app/screens/home/home_screen/components/slide_action_widgets/speak_slide_action_widget.dart';
import 'package:wordmind/database/word_hive_model.dart';
import '../list_tile_widget.dart';

class LookUpWidget extends StatelessWidget {
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
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Slidable(
                  actionPane: const SlidableDrawerActionPane(),
                  actionExtentRatio: 0.20,
                  actions: <Widget>[
                    SlideActionSpeak(data: data),
                  ],
                  secondaryActions: <Widget>[
                    DeleteSlideAction(index: index),
                  ],
                  child: ListTileItem(data: data, index: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
