import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../global/export/export.dart';

class CustomTextField extends StatelessWidget {
  final Function? onTap;
  final double? textFieldH;
  final String? label;
  final TextEditingController controller;
  final String? labelText;
  final Icon? icon;

  CustomTextField({
    Key? key,
    this.onTap,
    this.textFieldH,
    this.label,
    required this.controller,
    this.labelText,
    this.icon,
  }) : super(key: key);

  final searchController = SearchController.instance;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: textFieldH ?? 30,
        child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: controller,
            autofocus: false,
            style: context.textTheme.bodyText1!
                .copyWith(fontStyle: FontStyle.italic),
            decoration: _inputDecoration,
          ),
          suggestionsCallback: (pattern) async => [
            "hello",
            "hello1",
            "hello2",
            "hello3",
            "hello4",
            "hello5",
            "hello"
          ],
          itemBuilder: (context, suggestion) => const ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("suggestion['name']"),
            subtitle: Text("hellohello"),
          ),
          onSuggestionSelected: (suggestion) => Get.to(SearchResultView()),
        ),
      );

  InputDecoration get _inputDecoration => InputDecoration(
        label: Builder(
          builder: (context) => Text(
            "Search",
            style: context.textTheme.bodyLarge!.copyWith(color: Colors.white),
          ),
        ),
        suffixIcon: _suffixIcon,
      );

  InkWell get _suffixIcon => InkWell(
        child: icon ?? const Text(""),
        onTap: () => onTap!(),
        splashColor: null,
      );

  void get searchForTheWord async {
    controller.text.isEmpty
        ? Get.snackbar(
            "Warning",
            "Please enter a text to search for!",
            snackPosition: SnackPosition.TOP,
            duration: const Duration(milliseconds: 3000),
          )
        : Get.to(SearchResultView());
    await searchController.fetchWord(controller.text);
    controller.text = "";
  }
}


    //  TextFormField(
      //   cursorColor: Colors.white,
      //   controller: controller,
      //   style: context.textTheme.bodyLarge!.copyWith(color: Colors.white),
      //   textAlign: TextAlign.justify,
      //   decoration: InputDecoration(
      //     label: Text(
      //       "Search",
      //       style: context.textTheme.bodyLarge!.copyWith(
      //         color: Colors.white,
      //       ),
      //     ),
      //     suffixIcon: InkWell(
      //       child: icon ?? const Text(""),
      //       onTap: () => onTap!(),
      //       splashColor: null,
      //     ),
      //   ),
      //   textInputAction: TextInputAction.done,
      //   onFieldSubmitted: (value) => searchForTheWord,

      // ),