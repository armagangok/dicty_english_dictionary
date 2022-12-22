import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';

class SpeakButton extends StatelessWidget {
  const SpeakButton({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    final TextToSpeech textToSpeech = TextToSpeech.instance;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width(0.02)),
      child: GestureDetector(
        onTap: () => textToSpeech.speakWordOneTime(data),
        child: const Icon(
          CupertinoIcons.speaker_3_fill,
          color: Colors.white,
        ),
      ),
    );
  }
}
