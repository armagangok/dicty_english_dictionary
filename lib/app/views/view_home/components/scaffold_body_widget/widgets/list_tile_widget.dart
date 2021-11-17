import 'package:flutter/material.dart';
import 'package:wordmind/database/word_hive_model.dart';
import 'package:wordmind/tts_helper/text_to_speech_helper.dart';

class ListTileItem extends StatelessWidget {
  final Word data;
  final int index;

  const ListTileItem({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: SingleChildScrollView(
        child: Card(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    "${data.word}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => speakWordOneTime("${data.word}"),
                icon: Icon(
                  Icons.record_voice_over,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          elevation: 7,
        ),
      ),
    );
  }
}
