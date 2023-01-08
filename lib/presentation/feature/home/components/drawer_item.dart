import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.onPressed,
    required this.iconData,
    required this.text,
  }) : super(key: key);

  final Function onPressed;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => onPressed(),
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    iconData,
                    size: 28,
                    color: context.colors.primary.withOpacity(0.8),
                  ),
                  SizedBox(width: context.mediumWidth),
                  AutoSizeText(
                    text,
                    style: context.textTheme.bodySmall!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: context.colors.primary.withOpacity(0.8),
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
              Icon(
                CupertinoIcons.forward,
                size: 28,
                color: context.colors.primary.withOpacity(0.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
