import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
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

  void get alternativeOnTap => Get.back();
}
