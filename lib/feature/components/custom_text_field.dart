import 'package:flutter/material.dart';

import '../../global/export/export.dart';

class CustomTextField extends StatelessWidget {
  final Function? onTap;
  final double? textFieldH;
  final String? label;
  final TextEditingController? controller;
  final String? labelText;
  final Icon? icon;

  CustomTextField({
    Key? key,
    this.onTap,
    this.textFieldH,
    this.label,
    this.controller,
    this.labelText,
    this.icon,
  }) : super(key: key);

  final searchController = SearchController.instance;

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
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (value) => searchForTheWord,
          
        
      ),
    );
  }

  void get searchForTheWord async {
    if (controller!.text.isEmpty) {
      Get.snackbar(
        "Warning",
        "Please enter a text to search for!",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(milliseconds: 3000),
      );
    } else {
      Get.to(SearchResultView());
      await searchController.fetchWord(controller!.text);
      controller!.text = "";
    }
  }
}
