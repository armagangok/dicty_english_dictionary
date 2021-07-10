import "package:flutter/material.dart";
import 'package:wordmind/utils/database_helper.dart';

class AddingPage extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: textController,
                keyboardType: TextInputType.multiline,
                maxLines: 20,
                cursorHeight: 20,
                cursorColor: Colors.amber[900],
                maxLength: 2000,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,

                  hintText: 'Type ',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  // hintStyle: Style(),
                  labelText: 'add text',

                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () async {
                    int i = await DatabaseHelper.instance.insert({
                      DatabaseHelper.columnName: textController.text,
                    });
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
            ],
          ),
        ),
      ),
    );
  }
}
