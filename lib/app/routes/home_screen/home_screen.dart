import 'package:flutter/material.dart';
import 'Widgets/listen_button_widget.dart';
import 'Widgets/look_up_button_widget.dart';
import 'Widgets/search_button_widget.dart';
import 'Widgets/settings_button_widget.dart';
import 'Widgets/type_word_button_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100.0),
          child: Column(
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
    );
  }
}
