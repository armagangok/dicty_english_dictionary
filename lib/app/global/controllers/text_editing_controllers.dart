import 'package:flutter/material.dart';

final TextController controllers = TextController();

class TextController {
  final TextEditingController _search = TextEditingController();
  TextEditingController get search => _search;
}
