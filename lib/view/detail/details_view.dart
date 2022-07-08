import 'package:flutter/material.dart';

import '../../../core/local/database/models/word_hive_model.dart';
import '../../feature/export/export.dart';

class DetailsView extends StatelessWidget {
  final Word data;

  const DetailsView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          context.width(0.05),
          context.width(0.05),
          context.width(0.05),
          0,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          dictData(
            "${data.word}",
            color: Colors.red,
            size: 25,
            fWeigth: FontWeight.w700,
          ),
          SizedBox(
            height: context.height(0.02),
          ),
          dictData(
            "${data.meaning1}",
            icon: const Icon(Icons.menu_book),
            fWeigth: FontWeight.w400,
          ),
          dictData(
            "${data.meaning2}",
            icon: const Icon(Icons.menu_book),
            fWeigth: FontWeight.w400,
          ),
          dictData(
            "Origin: " "${data.origin}",
            icon: const Icon(Icons.trip_origin),
            fWeigth: FontWeight.w400,
          ),
          dictData(
            "${data.example}",
            icon: const Icon(Icons.star),
            fWeigth: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
