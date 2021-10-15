import "package:flutter/material.dart";
import 'package:wordmind/app/screens/word_adding_screen/widgets/appBar_widget.dart';
import 'package:wordmind/app/screens/word_adding_screen/widgets/textField.dart';

class AddingPage extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar(textController),
        backgroundColor: Colors.grey[400],
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              textField(textController),
            ],
          ),
        ),
      ),
    );
  }
}
