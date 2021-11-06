import 'package:flutter/material.dart';

class AddingScreenTextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String label;

  const AddingScreenTextFieldWidget({
    Key? key,
    required this.textController,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: TextInputType.multiline,
      cursorHeight: 20,
      decoration: InputDecoration(
        labelText: "$label",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
