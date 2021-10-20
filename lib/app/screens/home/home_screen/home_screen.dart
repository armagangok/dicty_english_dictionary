import 'package:flutter/material.dart';
import '../Widgets/scaffold_body_widget.dart';
import 'widgets/bottom_appbar_widget.dart';

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
