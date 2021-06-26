import "package:flutter/material.dart";

class AddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 10,
      ),
      child: Column(
        children: <Widget>[
          TextFormField(
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
              border: OutlineInputBorder(),
              fillColor: Colors.yellow[100],
              filled: true,
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
