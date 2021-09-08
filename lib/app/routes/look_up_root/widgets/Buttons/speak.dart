import 'package:flutter/material.dart';
import 'package:wordmind/models/tts_helper/text_to_speech_helper.dart';

class SpeakButton extends StatelessWidget {
  final data;

  const SpeakButton({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.record_voice_over),
      color: Colors.blue[500],
      iconSize: 30,
      splashColor: Colors.blue,
      onPressed: () {
        speak(data.word);
      },
    );
  }
}
