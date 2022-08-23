import 'package:flutter/material.dart';

import '../../global/export/export.dart';

class ExpandedItem extends StatelessWidget {
  ExpandedItem({
    Key? key,
    required this.clickedNumber,
    required this.text,
    required this.amount,
    required this.onTap,
  }) : super(key: key);

  final Function onTap;
  final int clickedNumber;
  final String text;
  final int amount;

  final tabBarController = Injection.instance.locator.get<TabBarController>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => InkWell(
        onTap: () => onTap(),
        child: Obx(
          () => Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.colors.onBackground,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(90),
              ),
              color: clickedNumber == tabBarController.currentIndex.value
                  ? context.colors.onBackground
                  : Colors.transparent,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.width(0.01),
              vertical: context.height(0.006),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    color: clickedNumber == tabBarController.currentIndex.value
                        ? Colors.white
                        : context.primary,
                  ),
                ),
                Obx(() => Text(
                      "($amount)",
                      style: TextStyle(
                        color:
                            clickedNumber == tabBarController.currentIndex.value
                                ? Colors.white
                                : context.primary,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
