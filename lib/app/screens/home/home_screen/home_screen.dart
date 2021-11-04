import 'package:flutter/material.dart';
import 'widgets/scaffold_body_widget/scaffold_body_widget.dart';

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

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      
      backgroundColor: Colors.white,
      child: Icon(
        Icons.add,
        color: Colors.black,
        size: 30,
      ),
      onPressed: () {},
    );
  }
}
