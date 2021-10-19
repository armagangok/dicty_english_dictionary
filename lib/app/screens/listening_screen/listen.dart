import "package:flutter/material.dart";
import 'package:hive/hive.dart';
import 'package:wordmind/tts_helper/text_to_speech_helper.dart';
import 'package:wordmind/tts_helper/tts_looper.dart';

class ListenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            informationText(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  startLoop(),
                  stopLoop(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget startLoop() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(),
      onPressed: () async {
        await Hive.openBox("timeBox");
        loop(Hive.box("timeBox").getAt(0));
      },
      child: Text(
        "Start",
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  Widget stopLoop() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(),
      onPressed: () {
        pause();
      },
      child: Text(
        "Stop",
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  Widget informationText() {
    return Text("Start or stop looping");
  }
}
