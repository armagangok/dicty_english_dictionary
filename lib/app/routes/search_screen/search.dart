import 'package:flutter/material.dart';
import 'widgets/search_button.dart';
import 'widgets/search_textfied.dart';

class Search extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: Colors.grey[600],
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[400],
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 3,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: searchTextField(textController),
                  ),
                  searchButton(textController, context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
