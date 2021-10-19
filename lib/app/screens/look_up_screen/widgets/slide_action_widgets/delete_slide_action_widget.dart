import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wordmind/database/hive_helper.dart';

class DeleteSlideAction extends StatelessWidget {
  final int index;

  const DeleteSlideAction({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () => hiveHelper.deleteData(index),
      ),
    );
  }
}
