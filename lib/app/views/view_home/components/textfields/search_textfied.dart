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
        ),
      ),
    );
  }
}
