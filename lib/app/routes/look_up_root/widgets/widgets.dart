import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wordmind/app/routes/look_up_root/widgets/Buttons/delete.dart';
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
      backgroundColor: Colors.grey[200],
      // ignore: deprecated_member_use
      body: WatchBoxBuilder(
        box: wordBox,
        builder: (context, wordBox) {
          return ListView.builder(
            itemCount: wordBox.length,
            itemBuilder: (context, index) {
              final data = wordBox.getAt(index) as Word;
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditText(index: index),
                    ),
                  );
                },
                title: wordField(data, wordBox, index),
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
          Delete(wordBox: wordBox, index: index),
        ],
      ),
      elevation: 10,
    );
  }
}
