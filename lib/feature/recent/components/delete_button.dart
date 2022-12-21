import 'package:flutter/material.dart';

import '../../../../../global/export/export.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () async => await HiveController.instance.deleteWord(index),
      child: const Icon(
        CupertinoIcons.trash,
        color: Colors.red,
      ),
    );
  }
}
