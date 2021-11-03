import 'package:flutter/material.dart';
import 'components/bottom_appbar/bottom_appbar_widget.dart';
import 'scaffold_body_widget/scaffold_body_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(        
        body: ScaffoldBodyWidget(),
        bottomNavigationBar: BottomAppBarWidget(),
      ),
    );
  }
}
