import 'package:flutter/material.dart';
import 'package:wordmind/database/words.dart';

class ListTileItem extends StatelessWidget {
  final Word data;
  final int index;

  const ListTileItem({Key? key, required this.data, required this.index })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 120,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Word; ${data.word}"),
                  SizedBox(height: 10),
                  Text("Origin; ${data.origin}"),
                  SizedBox(height: 10),
                  Text("First meaning, ${data.meaning1}"),
                  SizedBox(height: 10),
                  Text("Second meaning, ${data.meaning2}"),
                  SizedBox(height: 10),
                  Text("Example; ${data.example}"),
                ],
              ),
            ),
          ),
        ),
        elevation: 10,
      ),
    );
  }
}
