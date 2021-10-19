import 'package:flutter/material.dart';
import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/database/words.dart';

PreferredSizeWidget appBar(textController) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    actions: [
      SaveButtonWidget(textController: textController),
    ],
  );
}

class SaveButtonWidget extends StatelessWidget {
  final textController;
  const SaveButtonWidget({Key? key, this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.save),
      onPressed: () {
        final word = Word(
          word: textController.text,
          origin: "",
          meaning1: "",
          meaning2: "",
          example: "",
        );
        hiveHelper.addData(word);
      },
    );
  }
}
