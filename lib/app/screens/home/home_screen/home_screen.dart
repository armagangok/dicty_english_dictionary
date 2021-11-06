import 'package:flutter/material.dart';
import 'components/buttons/floating_action_button.dart';
import 'components/scaffold_body_widget/scaffold_body_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScaffoldBodyWidget(),
        floatingActionButton: FloatingActionButtonWidget(),
      ),
    );
  }
}
