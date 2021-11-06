import 'package:flutter/material.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import 'package:wordmind/app/screens/home/home_screen/components/dialog_widget/dialog_widget.dart';
import 'package:wordmind/services/fetch_word.dart';
import 'look_up.dart';
import '../../components/buttons/search_button.dart';
import '../../components/textfields/search_textfied.dart';
import '../../components/buttons/setting_button.dart';

late Future<WordApi> wordInfo;

class ScaffoldBodyWidget extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                SettingButton(),
                Expanded(
                  child: SearchTextWidget(textController: textController),
                ),
                SearchWordButtonWidget(
                  onPressed: () => onPressed(),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.15,
            child: LookUpScreen(),
          ),
        ],
      ),
    );
  }

  void onPressed() {
    wordInfo = fetchWord(textController.text);
    dialogScreen(wordInfo);
    textController.clear();
  }
}
