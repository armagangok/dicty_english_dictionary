import "package:flutter/material.dart";
import 'package:wordmind/app/screens/word_adding_screen/widgets/appbar_widget.dart';
import 'package:wordmind/app/screens/word_adding_screen/widgets/text_field_widget.dart';

class AddingPage extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar(textEditingController),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              AddingScreenTextFieldWidget(
                textController: textEditingController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
