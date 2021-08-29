import "package:flutter/material.dart";
import 'package:wordmind/database/hive.dart';
import 'package:wordmind/models/words.dart';

class AddingPage extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[400],
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: TextFormField(
                    controller: textController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 15,
                    cursorHeight: 20,
                    cursorColor: Colors.amber[900],
                    maxLength: 2000,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type ',
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'add text',
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      final word = Word(this.textController.text);
                      addData(word);
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
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
