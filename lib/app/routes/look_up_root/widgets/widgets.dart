import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wordmind/models/tts_helper/text_to_speech_helper.dart';
import 'package:wordmind/models/words.dart';
import 'edit_text.dart';

class Widgets extends StatefulWidget {
  @override
  _WidgetsState createState() => _WidgetsState();
}

@override
class _WidgetsState extends State<Widgets> {
  @override
  Widget build(BuildContext context) {
    final wordBox = Hive.box("words");
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
                      builder: (context) => EditText(
                        index: index,
                      ),
                    ),
                  );
                },
                title: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.record_voice_over),
                        color: Colors.blue[500],
                        iconSize: 30,
                        splashColor: Colors.blue,
                        onPressed: () {
                          speak(data.word);
                        },
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                            border: Border.all(
                              width: 2,
                            ),
                          ),
                          height: 110,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  data.word,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red[500],
                        iconSize: 30,
                        splashColor: Colors.red[900],
                        onPressed: () {
                          wordBox.deleteAt(index);
                        },
                      ),
                    ],
                  ),
                  elevation: 10,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
