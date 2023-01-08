import 'package:flutter/material.dart';

class TextController {
  TextController._();
  static final instance = TextController._();

  final TextEditingController _search = TextEditingController();
  TextEditingController get search => _search;
}
