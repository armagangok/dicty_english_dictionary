import "package:flutter/material.dart";

class AddingPage extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
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

                  fillColor: Colors.white70,
                  filled: true,
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
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
