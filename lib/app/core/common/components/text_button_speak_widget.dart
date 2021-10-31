import 'package:flutter/material.dart';
import 'package:wordmind/tts_helper/text_to_speech_helper.dart';

class TextSpeakButtonWidget extends StatelessWidget {
  final String? data;
  const TextSpeakButtonWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        data!,
        style: TextStyle(color: Colors.red),
      ),
      onPressed: () => flutterTts.speak(data!),
    );
  }
}
