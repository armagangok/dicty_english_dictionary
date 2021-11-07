import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wordmind/database/word_hive_model.dart';
import 'package:wordmind/tts_helper/text_to_speech_helper.dart';

class SlideActionSpeak extends StatelessWidget {
  const SlideActionSpeak({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Word data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: IconSlideAction(
        caption: 'Speak',
        color: Colors.blue,
        icon: Icons.record_voice_over,
        onTap: () => speakWord(data),
      ),
    );
  }
}
