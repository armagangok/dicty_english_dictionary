import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:english_accent_dictionary/core/database/word_hive_model.dart';

class SlideActionWidget extends StatelessWidget {
  final Word? data;
  final IconData? icon;
  final Color? bgColor;
  final String? iconText;
  final Function? onTap;

  const SlideActionWidget({
    Key? key,
    this.data,
    this.icon,
    this.bgColor,
    this.iconText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: IconSlideAction(
        caption: '$iconText',
        color: bgColor,
        icon: icon,
        onTap: () => onTap!(),
      ),
    );
  }
}
