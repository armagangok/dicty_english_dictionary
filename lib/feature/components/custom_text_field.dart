import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';
import '../../global/constant/app_color/app_color.dart';

class CustomTextField extends StatelessWidget {
  final Function? onTap;
  final double? textFieldH;
  final String? label;
  final TextEditingController? controller;
  final String? labelText;
  final Icon? icon;

  const CustomTextField({
    Key? key,
    this.onTap,
    this.textFieldH,
    this.label,
    this.controller,
    this.labelText,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: textFieldH ?? 30,
      child: TextFormField(
        cursorColor: AppColor.primaryColor,
        controller: controller,
        textAlign: TextAlign.justify,
        decoration: InputDecoration(
          label: Text(
            "Search",
            style: context.textTheme.bodyMedium!
                .copyWith(color: AppColor.primaryColorBright),
          ),
          suffixIcon: InkWell(
            child: icon ?? const Text(""),
            onTap: () => onTap!(),
            splashColor: null,
            focusColor: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
