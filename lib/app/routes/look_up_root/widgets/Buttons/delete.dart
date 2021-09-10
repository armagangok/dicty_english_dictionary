import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DeleteButton extends StatelessWidget {
  final Box wordBox;
  final index;

  const DeleteButton({
    Key? key,
    required this.wordBox,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      color: Colors.red[500],
      iconSize: 30,
      splashColor: Colors.red,
      onPressed: () {
        wordBox.deleteAt(index);
      },
    );
  }
}
