import 'package:flutter/material.dart';

class SearchTextWidget extends StatelessWidget {
  final TextEditingController textController;

  const SearchTextWidget({
    Key? key,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          labelText: "a word, phrase",
          labelStyle: TextStyle(fontSize: 14),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
