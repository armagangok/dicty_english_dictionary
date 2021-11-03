import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wordmind/app/screens/home/home_screen/components/buttons/save_button.dart';
import 'package:wordmind/app/screens/home/home_screen/widgets/future_builder_widget.dart';
import 'package:wordmind/services/fetch_word.dart';

late Future wordInfo;

class SearchWordButtonWidget extends StatelessWidget {
  final TextEditingController textController;
  const SearchWordButtonWidget({Key? key, required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final String text = textController.text;
        wordInfo = fetchWord(text);
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FutureBuilderWidget(wordInfo: wordInfo),
                    SaveButton(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      icon: Icon(Icons.search, size: 30),
    );
  }
}
