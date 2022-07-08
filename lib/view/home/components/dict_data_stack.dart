import 'package:english_accent_dictionary/core/remote/api/models/word_model.dart';
import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  final WordModel wordModel;
  const Data({
    Key? key,
    required this.wordModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 1.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          dictData(
            wordModel.word ?? "",
            size: 25,
            color: Colors.red,
            fWeigth: FontWeight.w700,
          ),
          const SizedBox(height: 10),
          dictData(
            wordModel.meaning1 ?? "",
            size: 14,
            fWeigth: FontWeight.w400,
            icon: const Icon(Icons.menu_book),
          ),
          const SizedBox(height: 10),
          dictData(
            wordModel.meaning2 ?? "",
            size: 14,
            fWeigth: FontWeight.w400,
            icon: const Icon(Icons.menu_book),
          ),
          const SizedBox(height: 10),
          dictData(
            wordModel.origin ?? "",
            size: 14,
            icon: const Icon(Icons.trip_origin),
            fWeigth: FontWeight.w400,
          ),
          const SizedBox(height: 10),
          dictData(
            wordModel.example ?? "",
            icon: const Icon(Icons.star),
            size: 14,
            fWeigth: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}

Widget dictData(
  String data, {
  Color? color,
  Widget? icon,
  double? size,
  FontWeight? fWeigth,
}) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: icon,
      ),
      Expanded(
        child: SelectableText(
          data,
          style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: fWeigth ?? FontWeight.w900,
          ),
        ),
      ),
    ],
  );
}
