import 'package:flutter/material.dart';
import 'Widgets/listen_button_widget.dart';
import 'Widgets/look_up_button_widget.dart';
import 'Widgets/search_button_widget.dart';
import 'Widgets/settings_button_widget.dart';
import 'Widgets/type_word_button_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Center(
        child: Container(
          color: Colors.grey[300],
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 5.2,
              horizontal: MediaQuery.of(context).size.width / 9,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                searchButton(context),
                typeWordButton(context),
                lookUpButton(context),
                listenButton(context),
                settingsButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
