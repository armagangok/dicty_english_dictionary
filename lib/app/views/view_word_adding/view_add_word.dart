import "package:flutter/material.dart";
import 'package:wordmind/app/components/common/buttons.dart';
import 'package:wordmind/app/components/common/textfields.dart';
import 'package:wordmind/app/controllers/text_editing_controllers.dart';
import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/database/word_hive_model.dart';

class AddWordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomTextField(
                        controller: textController.word,
                        label: 'Word',
                      ),
                      CustomTextField(
                        controller: textController.origin,
                        label: 'Origin',
                      ),
                      CustomTextField(
                        controller: textController.meaning1,
                        label: 'First Meaning',
                      ),
                      CustomTextField(
                        controller: textController.meaning2,
                        label: 'Second Meaning',
                      ),
                      CustomTextField(
                        controller: textController.example,
                        label: 'Example',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomElevatedButton(
                    buttonH: 35,
                    buttonW: MediaQuery.of(context).size.width,
                    onPressed: ()  {
                      final word = Word(
                        word: textController.word.text,
                        origin: textController.origin.text,
                        meaning1: textController.meaning1.text,
                        meaning2: textController.meaning2.text,
                        example: textController.example.text,
                      );
                      hiveHelper.addData(word);
                      textController.word.clear();
                      textController.origin.clear();
                      textController.meaning1.clear();
                      textController.meaning2.clear();
                      textController.example.clear();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
