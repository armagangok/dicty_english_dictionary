import "package:flutter/material.dart";
import '../../utils/utils.dart';
import 'package:wordmind/database/file.dart';

class AddingPage extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: textController,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                cursorHeight: 20,
                cursorColor: Colors.black,
                maxLength: 2000,
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  hintText: 'Type ',
                  labelText: 'add text',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue,
                    width: 3,
                  )),
                  fillColor: Colors.yellow[50],
                  filled: true,
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      // insertWord();
                      // FileUtils.saveToFile(textController.text + '\n');
                      insertData();
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.amber[900]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
