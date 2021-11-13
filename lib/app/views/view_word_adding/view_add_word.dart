import "package:flutter/material.dart";
import 'package:wordmind/app/controllers/text_editing_controllers.dart';
import 'package:wordmind/app/views/view_word_adding/widgets/text_field_widget.dart';
import 'widgets/save_button_widget.dart.dart';

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
                      AddingScreenTextFieldWidget(
                        textController: textController.word,
                        label: 'Word',
                      ),
                      AddingScreenTextFieldWidget(
                        textController: textController.origin,
                        label: 'Origin',
                      ),
                      AddingScreenTextFieldWidget(
                        textController: textController.meaning1,
                        label: 'First Meaning',
                      ),
                      AddingScreenTextFieldWidget(
                        textController: textController.meaning2,
                        label: 'Second Meaning',
                      ),
                      AddingScreenTextFieldWidget(
                        textController: textController.example,
                        label: 'Example',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SaveManualWordButton(
                  word1: textController.word,
                  origin: textController.origin,
                  meaning1: textController.meaning1,
                  meaning2: textController.meaning2,
                  example: textController.example,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
