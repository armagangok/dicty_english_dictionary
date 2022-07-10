import 'package:flutter/material.dart';

extension EasyContext on BuildContext {
  double height(double ratio) => MediaQuery.of(this).size.height * ratio;
  double width(double ratio) => MediaQuery.of(this).size.width * ratio;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get primaryColor => theme.primaryColor;
  Size get size => MediaQuery.of(this).size;
  EdgeInsets get padding => MediaQuery.of(this).padding;

  EdgeInsets symmetric({
    double horizontal = 0,
    double vertical = 0,
    bool bothVertical = false,
  }) =>
      EdgeInsets.symmetric(
        horizontal:
            bothVertical ? height(1) * horizontal : width(1) * horizontal,
        vertical: bothVertical ? height(1) * horizontal : width(1) * vertical,
      );

  EdgeInsets verticalPadding({
    double left = 0,
    double top = 0,
    double rigth = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.only(
        left: left,
        top: top,
        right: rigth,
        bottom: bottom,
      );

  void dismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
