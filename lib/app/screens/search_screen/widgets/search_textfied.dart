import 'package:flutter/material.dart';

class SearchTextWidget extends StatelessWidget {
  final textController;
  const SearchTextWidget({Key? key, this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        // fillColor: Colors.grey[200],
        filled: true,
        labelText: "type a word or phrase",
        // labelStyle: TextStyle(color: Colors.black, fontSize: 15),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
