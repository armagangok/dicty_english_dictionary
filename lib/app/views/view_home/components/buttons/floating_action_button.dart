import 'package:flutter/material.dart';
import 'package:wordmind/app/core/navigation/get_to_screen.dart';
import 'package:wordmind/app/views/view_word_adding/view_add_word.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: Icon(
        Icons.add,
        color: Colors.black,
        size: 30,
      ),
      onPressed: () => navigation.getTo(AddWordView()),
    );
  }
}
