import 'package:flutter/material.dart';
import 'look_up_widgets/look_up.dart';
import '../components/textfields/search_textfied.dart';
import '../components/buttons/search_button.dart';

class ScaffoldBodyWidget extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 22),
            child: Row(
              children: [
                Expanded(
                  child: SearchTextWidget(textController: textController),
                ),
                SearchWordButtonWidget(textController: textController),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.3,
            child: LookUpScreen(),
          ),
        ],
      ),
    );
  }
}
