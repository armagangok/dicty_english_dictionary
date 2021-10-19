import 'package:flutter/material.dart';
import 'Widgets/bottom_appbar_widget.dart';
import 'Widgets/scaffold_body_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          bottomNavigationBar: BottomAppBarWidget(),
          body: ScaffoldBodyWidget(),
        ),
      ),
    );
  }
}
