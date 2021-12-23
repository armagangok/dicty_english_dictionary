import 'package:flutter/material.dart';

import '../../../../../../core/database/models/word_hive_model.dart';
import '../../../../../../core/tts_helper/text_to_speech_helper.dart';

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
                    style:const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => speakWordOneTime("${data.word}"),
                icon:const Icon(
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
