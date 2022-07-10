import 'package:flutter/material.dart';

import '../../../feature/export/export.dart';

class WordWidget extends StatelessWidget {
  final WordModel wordModel;
  const WordWidget({
    Key? key,
    required this.wordModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: context.width(0.05),
      ),
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [
        dictData(
          wordModel.word!,
          size: 25,
          textColor: Colors.red,
          fWeigth: FontWeight.w700,
        ),
        const SizedBox001(),
        dictData(
          wordModel.meaning1!,
          size: 14,
          fWeigth: FontWeight.w400,
          icon: const Icon(Icons.menu_book),
        ),
        const SizedBox001(),
        dictData(
          wordModel.meaning2!,
          size: 14,
          fWeigth: FontWeight.w400,
          icon: const Icon(Icons.menu_book),
        ),
        const SizedBox001(),
        dictData(
          wordModel.origin!,
          size: 14,
          icon: const Icon(Icons.trip_origin),
          fWeigth: FontWeight.w400,
        ),
        const SizedBox001(),
        dictData(
          wordModel.example!,
          icon: const Icon(Icons.star),
          size: 14,
          fWeigth: FontWeight.w400,
        ),
      ],
    );
  }
}

class SizedBox001 extends StatelessWidget {
  const SizedBox001({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height(0.02),
    );
  }
}

Widget dictData(
  String data, {
  Color? textColor,
  Widget? icon,
  double? size,
  FontWeight? fWeigth,
}) {
  return Builder(
    builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: icon == null
                ? EdgeInsets.zero
                : EdgeInsets.only(right: context.width(0.03)),
            child: icon,
          ),
          Expanded(
            child: SelectableText(
              data,
              style: TextStyle(
                color: textColor,
                fontSize: size,
              ),
            ),
          ),
        ],
      );
    },
  );
}
