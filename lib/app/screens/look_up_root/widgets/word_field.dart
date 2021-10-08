import 'package:flutter/material.dart';

class WordField extends StatefulWidget {
  final String data;

  const WordField({
    required Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _WordFieldState createState() => _WordFieldState();
}

class _WordFieldState extends State<WordField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
          border: Border.all(
            width: 2,
          ),
        ),
        height: 110,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              padding: const EdgeInsets.all(3),
              child: Text(
                widget.data,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
