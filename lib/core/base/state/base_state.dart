import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);

  double height(double value) => MediaQuery.of(context).size.height * value;
  double width(double value) => MediaQuery.of(context).size.width * value;
}

abstract class BaseStateless<T extends StatelessWidget> extends State {
  ThemeData get themeData => Theme.of(context);

  TextTheme get textTheme => themeData.textTheme;

  double height(double value) => MediaQuery.of(context).size.height * value;
  double width(double value) => MediaQuery.of(context).size.width * value;
}
