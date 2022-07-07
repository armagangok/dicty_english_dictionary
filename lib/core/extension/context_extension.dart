import 'package:flutter/material.dart';

extension EasyContext on BuildContext {
  double height(double ratio) => MediaQuery.of(this).size.height * ratio;
  double width(double ratio) => MediaQuery.of(this).size.width * ratio;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get primaryColor => theme.primaryColor;
  Size get size => MediaQuery.of(this).size;
  EdgeInsets get edgeInsets => MediaQuery.of(this).padding;

  void dismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}