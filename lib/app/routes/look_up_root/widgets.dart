import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
      backgroundColor: Colors.grey[400],
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
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70,
                            border: Border.all(
                              width: 3,
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
                        icon: const Icon(
                          Icons.delete,
                        ),
                        color: Colors.red[900],
                        iconSize: 20,
                        splashColor: Colors.red,
                        onPressed: () {
                          wordBox.deleteAt(index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
