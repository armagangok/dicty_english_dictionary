import "package:flutter/material.dart";
import 'package:wordmind/app/screens/word_adding_screen/widgets/text_field_widget.dart';
import 'package:wordmind/database/hive_helper.dart';
import 'package:wordmind/database/words.dart';

class AddingPage extends StatelessWidget {
  final TextEditingController word = TextEditingController();
  final TextEditingController origin = TextEditingController();
  final TextEditingController meaning1 = TextEditingController();
  final TextEditingController meaning2 = TextEditingController();
  final TextEditingController example = TextEditingController();
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AddingScreenTextFieldWidget(
                      textController: word,
                      label: 'Word',
                    ),
                    AddingScreenTextFieldWidget(
                      textController: origin,
                      label: 'Origin',
                    ),
                    AddingScreenTextFieldWidget(
                      textController: meaning1,
                      label: 'First Meaning',
                    ),
                    AddingScreenTextFieldWidget(
                      textController: meaning2,
                      label: 'Second Meaning',
                    ),
                    AddingScreenTextFieldWidget(
                      textController: example,
                      label: 'Example',
                    ),
                  ],
                ),
              ),
              bbbb(
                word1: word,
                origin: origin,
                meaning1: meaning1,
                meaning2: meaning2,
                example: example,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class bbbb extends StatelessWidget {
  const bbbb({
    Key? key,
    required this.word1,
    required this.origin,
    required this.meaning1,
    required this.meaning2,
    required this.example,
  }) : super(key: key);

  final TextEditingController word1;
  final TextEditingController origin;
  final TextEditingController meaning1;
  final TextEditingController meaning2;
  final TextEditingController example;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final word = Word(
            word: word1.text,
            origin: origin.text,
            meaning1: meaning1.text,
            meaning2: meaning2.text,
            example: example.text,
          );
          hiveHelper.addData(word);
        },
        child: Text("save"),
      ),
    );
  }
}
