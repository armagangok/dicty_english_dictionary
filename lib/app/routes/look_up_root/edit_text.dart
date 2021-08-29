import 'package:flutter/material.dart';
import 'package:wordmind/database/hive.dart';
import 'package:wordmind/models/words.dart';

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
    textEditingController = TextEditingController(text: getData(widget.index));
    super.initState();
  }

  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[400],
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  controller: textEditingController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  cursorHeight: 20,
                  cursorColor: Colors.black,
                  maxLength: 2000,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    labelText: 'edit text',
                    // hintText: "Type",

                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  final word = Word(this.textEditingController.text);
                  deleteAt(widget.index);
                  addData(word);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0.0,
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
