import 'package:flutter/material.dart';

import '../../../feature/export/export.dart';

class SettingItem extends StatelessWidget {
  final String text;
  final Widget icon;
  final Function onTap;
  final String data;

  const SettingItem({
    Key? key,
    required this.text,
    this.icon = const Icon(
      Icons.arrow_forward_ios_rounded,
      color: Colors.grey,
    ),
    required this.onTap,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: context.textTheme.titleSmall,
                  maxLines: 1,
                ),
                Text(
                  data,
                  style: context.textTheme.titleSmall!.copyWith(
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          icon,
        ],
      ),
    );
  }
}
