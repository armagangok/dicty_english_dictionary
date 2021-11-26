import 'package:flutter/material.dart';
import 'package:wordmind/database/word_hive_model.dart';

class DetailsView extends StatelessWidget {
  final Word data;

  const DetailsView({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: f(
                      "${data.word}",
                      color: Colors.red,
                      size: 25,
                      fWeigth: FontWeight.w700,
                    ),
                  ),
                  f(
                    "${data.meaning1}",
                    icon: Icon(Icons.menu_book),
                    fWeigth: FontWeight.w400,
                  ),
                  f(
                    "${data.meaning2}",
                    icon: Icon(Icons.menu_book),
                    fWeigth: FontWeight.w400,
                  ),
                  f(
                    "Origin: " "${data.origin}",
                    fWeigth: FontWeight.w400,
                  ),
                  f(
                    "${data.example}",
                    icon: Icon(Icons.star),
                    fWeigth: FontWeight.w400,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

Widget f(
  String data, {
  Color? color,
  Widget? icon,
  double? size,
  FontWeight? fWeigth,
}) {
  debugPrint(fWeigth.toString());
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
