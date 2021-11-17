import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wordmind/app/views/view_word_adding/view_add_word.dart';

class AddWordButtonWidget extends StatelessWidget {
  const AddWordButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.to(() => AddWordView()),
      icon: Icon(Icons.add_chart, size: 30),
    );
  }
}
