import 'package:english_accent_dictionary/core/navigation/contract/base_navigation_service.dart';
import 'package:flutter/material.dart';

import '../../../global/export/export.dart';

class IosDeleteDialog extends StatefulWidget {
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
  State<IosDeleteDialog> createState() => _IosDeleteDialogState();
}

class _IosDeleteDialogState extends State<IosDeleteDialog> {
  final navigator = getIt.call<NavigationServiceContract>();
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
          warningText(context),
          SizedBox(height: context.height(0.02)),
          messageText(context),
          const Divider(height: 0),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _dialogButton(
                  "Cancel",
                  () {
                    navigator.getBack();
                  },
                ),
                const VerticalDivider(width: 0),
                _dialogButton(
                  "Okey",
                  () {
                    widget.dialogAction();
                    navigator.getBack();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding messageText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height(0.02)),
      child: Text(
        widget.message,
        style: context.textTheme.bodyText2!.copyWith(),
      ),
    );
  }

  Padding warningText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height(0.02)),
      child: Text(
        widget.title,
        style: context.textTheme.titleLarge!.copyWith(),
      ),
    );
  }

  Widget _dialogButton(String text, Function onTap) {
    return Builder(builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.height(0.02),
        ),
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
            ),
          ),
        ),
      );
    });
  }
}
