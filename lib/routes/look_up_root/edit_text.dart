import 'package:flutter/material.dart';

void editingField(BuildContext ctx) {
  showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return EditText();
      });
}

class EditText extends StatelessWidget {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 500,
        child: Column(children: [
          TextFormField(
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
              hintText: 'Type ',
              labelText: 'edit text',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 3,
                ),
              ),
              fillColor: Colors.amber[400],
              filled: true,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
              ),
              child: Text(
                "Save",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
