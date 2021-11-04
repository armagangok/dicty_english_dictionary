import 'package:flutter/material.dart';
import 'package:wordmind/app/screens/home/home_screen/components/buttons/setting_button.dart';
import 'look_up_widgets/look_up.dart';
import '../../components/buttons/search_button.dart';
import '../../components/textfields/search_textfied.dart';

class ScaffoldBodyWidget extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SettingButton(),
              Expanded(
                child: SearchTextWidget(textController: textController),
              ),
              SearchWordButtonWidget(textController: textController),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.15,
            child: LookUpScreen(),
          ),
        ],
      ),
    );
  }
}
