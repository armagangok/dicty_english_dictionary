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
                        controller: controllers.word,
                        label: 'Word',
                      ),
                      CustomTextField(
                        controller: controllers.origin,
                        label: 'Origin',
                      ),
                      CustomTextField(
                        controller: controllers.meaning1,
                        label: 'First Meaning',
                      ),
                      CustomTextField(
                        controller: controllers.meaning2,
                        label: 'Second Meaning',
                      ),
                      CustomTextField(
                        controller: controllers.example,
                        label: 'Example',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomElevatedButton(
                  text: "save",
                  buttonH: 30,
                  buttonW: MediaQuery.of(context).size.width,
                  onPressed: () {
                    final word = Word(
                      word: controllers.word.text,
                      origin: controllers.origin.text,
                      meaning1: controllers.meaning1.text,
                      meaning2: controllers.meaning2.text,
                      example: controllers.example.text,
                    );
                    hiveHelper.addData(word);
                    controllers.word.clear();
                    controllers.origin.clear();
                    controllers.meaning1.clear();
                    controllers.meaning2.clear();
                    controllers.example.clear();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
