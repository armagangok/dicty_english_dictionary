import 'package:flutter/material.dart';
import 'package:wordmind/app/screens/home/home_screen/components/buttons/add_word_button.dart';


class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 60,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddWordButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}




