import "package:flutter/material.dart";
import 'package:wordmind/app/database/hive.dart';
import 'package:wordmind/models/words.dart';

class AddingPage extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[600],
          title: Text(
            "Add",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        backgroundColor: Colors.grey[200],
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  TextFormField(
                    controller: textController,
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
                  Container(
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.grey[500]),
                      onPressed: () {
                        final word = Word(this.textController.text);
                        addData(word);
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
