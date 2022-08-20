import 'package:english_accent_dictionary/core/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("About Us"),
      ),
      body: Center(
        child: ListView(
          children: const [
            Text("Some about me text."),
          ],
        ),
      ),
    );
  }
}
