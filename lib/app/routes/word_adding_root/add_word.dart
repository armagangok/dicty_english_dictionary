import "package:flutter/material.dart";
import 'package:wordmind/app/routes/word_adding_root/widgets/button.dart';
import 'package:wordmind/app/routes/word_adding_root/widgets/textField.dart';

class AddingPage extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[600],
        ),
        backgroundColor: Colors.grey[200],
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              textField(textController),
              saveButton(textController),
            ],
          ),
        ),
      ),
    );
  }
}
