import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/database/words.dart';
import 'edit_text.dart';
import './Buttons/speak.dart';
import './word_field.dart';

class Widgets extends StatelessWidget {
  final wordBox = Hive.box("words");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
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
                    onTap: () => hiveHelper.deleteData(index),
                  ),
                ],
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditText(index: index),
                      ),
                    );
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
