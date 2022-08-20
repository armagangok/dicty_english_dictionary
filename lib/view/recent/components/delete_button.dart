import 'package:flutter/material.dart';

import '../../../feature/export/export.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await HiveController.instance.deleteData(index),
      child: const Icon(
        CupertinoIcons.trash,
        color: Colors.red,
      ),
    );
  }
}
