import 'package:flutter/material.dart';
import 'widgets/search_button.dart';

class Search extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 3,
                vertical: 10,
              ),
              child: Row(
                children: [
                  SearchWordButtonWidget(textController: textController)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
