import 'package:flutter/material.dart';

import '../../../feature/controller/hive_controller.dart';
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
      onTap: () async => await HiveService.instance.deleteData(index),
      child: const Icon(
        CupertinoIcons.trash,
        color: Colors.red,
      ),
    );
  }
}
