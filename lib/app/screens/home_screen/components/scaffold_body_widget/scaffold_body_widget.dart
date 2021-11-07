import 'package:flutter/material.dart';
import 'look_up.dart';
import '../../components/buttons/search_button.dart';
import '../../components/textfields/search_textfied.dart';
import '../../components/buttons/setting_button.dart';
import '../../components/dialog_widget/dialog_widget.dart';
import '../../../../../services/fetch_word.dart';
import '../../../../../API/models/word_api_model.dart';

late Future<WordApi> wordInfo;

class ScaffoldBodyWidget extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
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
      ),
    );
  }

  void onPressed() {
    wordInfo = fetchWord(textController.text);
    dialogScreen(wordInfo);
    textController.clear();
  }
}
