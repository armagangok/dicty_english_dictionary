

import 'package:flutter/material.dart';

import '../../../feature/export/export.dart';

class ListTileItem extends StatelessWidget {
  final Word data;
  final int index;

  const ListTileItem({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      
      title: SingleChildScrollView(
        child: Card(
          child: Row(
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
                  Icons.record_voice_over,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
