import 'package:flutter/material.dart';
import 'package:wordmind/app/database/hive.dart';
import 'Buttons/save_editted_text_button.dart';
import 'TextFormField/text_form_field.dart';

class EditText extends StatefulWidget {
  final int index;

  EditText({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  var textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController = TextEditingController(
      text: getData(widget.index),
    );
    super.initState();
  }

  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey[400],
          actions: [
            saveButton(textEditingController, widget.index),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: textFormFied(textEditingController),
          ),
        ),
      ),
    );
  }
}
