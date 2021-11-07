import 'package:flutter/material.dart';
import 'package:wordmind/app/core/navigation/get_to_screen.dart';
import 'package:wordmind/app/screens/word_adding_screen/add_word_screen.dart';

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
      onPressed: () => navigation.getTo(AddWordScreen()),
    );
  }
}
