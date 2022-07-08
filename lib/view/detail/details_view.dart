import 'package:flutter/material.dart';

import '../../../core/local/database/models/word_hive_model.dart';
import '../../feature/export/export.dart';

class DetailsView extends StatelessWidget {
  final Word data;

  const DetailsView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AdvertisementWidget(
        ad: generateAd.ad,
        unitID: adHelper.bannerAdUnitId4,
      ),
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 70,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: dictData(
                      "${data.word}",
                      color: Colors.red,
                      size: 25,
                      fWeigth: FontWeight.w700,
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
