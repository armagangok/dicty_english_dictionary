import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../feature/export/export.dart';

class ListTileItem extends StatelessWidget {
  final HiveWord data;
  final int index;

  const ListTileItem({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.dialog(buildDialog()),
      onLongPress: () {},
      tileColor: Colors.transparent,
      title: Row(
        children: [
          Expanded(
            child: Text(
              "${data.word}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: () => speakWordOneTime("${data.word}"),
            icon: const Icon(
              CupertinoIcons.speaker_3_fill,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  //

  Widget buildDialog() {
    return Builder(
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.7, sigmaY: 0.7),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ListView(
              padding: EdgeInsets.all(
                context.width(0.05),
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
                SizedBox(height: context.height(0.02)),
                dictData(
                  "Meaning ${data.meaning1}",
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
          ),
        );
      },
    );
  }
}
