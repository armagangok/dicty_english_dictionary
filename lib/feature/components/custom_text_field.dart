import 'package:flutter/material.dart';

import '../../feature/export/export.dart';



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
        cursorColor: Colors.white,
        controller: controller,
        style: context.textTheme.bodyLarge!.copyWith(color: Colors.white),
        textAlign: TextAlign.justify,
        decoration: InputDecoration(
          label: Text(
            "Search",
            style: context.textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            ),
          ),
          suffixIcon: InkWell(
            child: icon ?? const Text(""),
            onTap: () => onTap!(),
            splashColor: null,

          ),
        ),
      ),
    );
  }
}
