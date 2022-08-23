import 'package:flutter/material.dart';

import '../../global/export/export.dart';

class IosDeleteDialog extends StatelessWidget {
  const IosDeleteDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.dialogAction,
  }) : super(key: key);

  final String title;
  final String message;
  final Function dialogAction;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: context.normalHeight),
            child: Text(
              title,
              style: context.textTheme.titleLarge!.copyWith(),
            ),
          ),
          Padding(
            padding: context.normalPadding,
            child: Text(
              message,
              style: context.textTheme.bodyText2!.copyWith(),
            ),
          ),
          const Divider(
            height: 0,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _dialogButton(
                  "Cancel",
                  () {
                    Get.back();
                  },
                ),
                const VerticalDivider(width: 0),
                _dialogButton(
                  "Okey",
                  () {
                    dialogAction();
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dialogButton(String text, Function onTap) {
    return Builder(builder: (context) {
      return Padding(
        padding: context.normalPadding,
        child: SizedBox(
          width: context.width(0.18),
          child: GestureDetector(
              onTap: () => onTap(),
              child: FittedBox(
                child: Text(
                  text,
                  maxLines: 1,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ),
      );
    });
  }
}
