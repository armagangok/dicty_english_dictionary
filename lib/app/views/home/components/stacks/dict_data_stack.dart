import 'package:flutter/material.dart';

class DictionaryDataStack extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const DictionaryDataStack({
    Key? key,
    required this.snapshot,
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
            snapshot.data.word ?? "",
            size: 25,
            color: Colors.red,
            fWeigth: FontWeight.w700,
          ),
          const SizedBox(height: 10),
          dictData(
            snapshot.data.meaning1 ?? "",
            size: 14,
            fWeigth: FontWeight.w400,
            icon: const Icon(Icons.menu_book),
          ),
          const SizedBox(height: 10),
          dictData(
            snapshot.data.meaning2 ?? "",
            size: 14,
            fWeigth: FontWeight.w400,
            icon: const Icon(Icons.menu_book),
          ),
          const SizedBox(height: 10),
          dictData(
            snapshot.data.origin ?? "",
            size: 14,
            fWeigth: FontWeight.w400,
          ),
          const SizedBox(height: 10),
          dictData(
            snapshot.data.example ?? "",
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
