import 'package:flutter/material.dart';
import 'package:wordmind/app/core/components/text_button/text_button_speak_widget.dart';
import 'package:wordmind/database/word_hive_model.dart';

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
      onTap: () {},
      title: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 200,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        child: Text("Word:"),
                        width: 65,
                      ),
                      Expanded(
                        child: Card(
                          child: TextSpeakButtonWidget(data: data.word),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Text("Origin:"),
                        width: 65,
                      ),
                      Expanded(
                        child: Card(
                          child: TextSpeakButtonWidget(data: data.origin),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Text("Meaning:"),
                        width: 65,
                      ),
                      Expanded(
                        child: Card(
                          child: TextSpeakButtonWidget(data: data.meaning1),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Text("Meaning:"),
                        width: 65,
                      ),
                      Expanded(
                        child: Card(
                          child: TextSpeakButtonWidget(data: data.meaning2),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Text("Example:"),
                        width: 65,
                      ),
                      Expanded(
                        child: Card(
                          child: TextSpeakButtonWidget(data: data.example),
                        ),
                      ),
                    ],
                  ),
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
