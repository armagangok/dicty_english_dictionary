import 'package:flutter/material.dart';
import 'package:wordmind/API/models/word_api_model.dart';
import 'package:wordmind/app/controllers/text_editing_controllers.dart';
import 'package:wordmind/services/fetch_word.dart';
import 'components/buttons/floating_action_button.dart';
import 'components/buttons/search_button.dart';
import 'components/buttons/setting_button.dart';
import 'components/dialog_widget/dialog_widget.dart';
import 'components/scaffold_body_widget/look_up.dart';
import 'components/textfields/search_textfied.dart';

late Future<WordApi> wordInfo;

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GestureDetector(
            child: Column(
              children: [
                Container(
                  color: Colors.grey,
                  child: Center(child: Text("Avertise Zone")),
                  height: 75,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      SettingButton(),
                      Expanded(
                        child: SearchTextWidget(
                          textController: textController.textController,
                        ),
                      ),
                      SearchWordButtonWidget(
                        onPressed: () => {
                          wordInfo =
                              fetchWord(textController.textController.text),
                          dialogScreen(wordInfo),
                          textController.textController.clear(),
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.25,
                  child: LookUpScreen(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButtonWidget(),
      ),
    );
  }
}
