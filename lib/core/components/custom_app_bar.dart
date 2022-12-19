import 'package:flutter/material.dart';

import '../../global/export/export.dart';
import '../navigation/contract/base_navigation_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.title,
    this.enableBackButton = true,
    this.height = kToolbarHeight,
    this.onTap,
    this.widget,
  }) : super(key: key);

  final Widget? title;
  final bool enableBackButton;
  final double? height;
  final Function? onTap;
  final Widget? widget;

  final navigator = getIt.call<NavigationServiceContract>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [widget ?? const SizedBox()],
      leading: enableBackButton
          ? GestureDetector(
              onTap: onTap != null ? () => onTap!() : () => alternativeOnTap,
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            )
          : const SizedBox(),
      title: title,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);

  void get alternativeOnTap => navigator.getBack();
}  