import 'package:flutter/material.dart';
import 'package:wordmind/app/screens/home/home_screen/widgets/look_up.dart';
import 'search_widgets/widgets/search_button.dart';
import 'search_widgets/widgets/search_textfied.dart';

class ScaffoldBodyWidget extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
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
      ),
    );
  }
}
