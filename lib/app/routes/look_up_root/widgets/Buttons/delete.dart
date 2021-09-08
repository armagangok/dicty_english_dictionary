import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Delete extends StatelessWidget {
  final Box wordBox;
  final index;

  const Delete({
    Key? key,
    required this.wordBox,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: isim(Colors.red[500]!));
  }

  Widget isim(Color color) {
    return IconButton(
      icon: const Icon(Icons.delete),
      color: Colors.red[500],
      iconSize: 30,
      splashColor: color,
      onPressed: () {
        wordBox.deleteAt(index);
      },
    );
  }
}
