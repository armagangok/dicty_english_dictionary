import 'package:flutter/material.dart';
import 'package:wordmind/app/core/components/container/sized_box.dart';
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
          height: MediaQuery.of(context).size.height * 0.28,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    ContainerWidget(textWidget: Text("Word")),
                    Expanded(
                      child: Card(
                        child: TextSpeakButtonWidget(data: data.word),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ContainerWidget(textWidget: Text("Origin")),
                    Expanded(
                      child: Card(
                        child: TextSpeakButtonWidget(data: data.origin),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    ContainerWidget(textWidget: Text("Meaning")),
                    Expanded(
                      child: Card(
                        child: TextSpeakButtonWidget(data: data.meaning1),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ContainerWidget(textWidget: Text("Meaning")),
                    Expanded(
                      child: Card(
                        child: TextSpeakButtonWidget(data: data.meaning2),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ContainerWidget(textWidget: Text("Example")),
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
        elevation: 10,
      ),
    );
  }
}
