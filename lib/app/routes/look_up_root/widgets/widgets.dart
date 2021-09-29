import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wordmind/app/routes/look_up_root/widgets/Buttons/speak.dart';
import 'package:wordmind/app/routes/look_up_root/widgets/word_field.dart';
import 'package:wordmind/models/words.dart';
import 'edit_text.dart';

class Widgets extends StatefulWidget {
  @override
  _WidgetsState createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> {
  final wordBox = Hive.box("words");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      // ignore: deprecated_member_use
      body: WatchBoxBuilder(
        box: wordBox,
        builder: (context, wordBox) {
          return ListView.builder(
            itemCount: wordBox.length,
            itemBuilder: (context, index) {
              final data = wordBox.getAt(index) as Word;
              return Slidable(
                actionPane: const SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                // actions: <Widget>[],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () => wordBox.deleteAt(index),
                  ),
                ],
                child: ListTile(
                  onTap: () {
                    Get.to(() => EditText(index: index));
                  },
                  subtitle: wordField(data, wordBox, index),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget wordField(Word data, Box box, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          SpeakButton(data: data),
          WordField(data: data.word, key: null),
          // DeleteButton(wordBox: wordBox, index: index),
        ],
      ),
      elevation: 10,
    );
  }
}
