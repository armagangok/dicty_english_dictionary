import 'package:flutter/material.dart';
import 'components/stacks/stacks.dart';

class SettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 70,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const ThemePickerWidget(),
                  const Divider(),
                  AccentPickerWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
