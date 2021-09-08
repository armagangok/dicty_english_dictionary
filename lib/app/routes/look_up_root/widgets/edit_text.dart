import 'package:flutter/material.dart';
import 'package:wordmind/app/database/hive.dart';
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

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[500],
          title: Text(
            "Editing",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  controller: textEditingController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
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
                TextButton(
                  onPressed: () {
                    final word = Word(this.textEditingController.text);
                    deleteAt(widget.index);
                    addData(word);
                  },
                  style: TextButton.styleFrom(),
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
