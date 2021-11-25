import 'package:flutter/material.dart';

TextController textController = TextController();

class TextController {
  final TextEditingController _word = TextEditingController();
  final TextEditingController _origin = TextEditingController();
  final TextEditingController _meaning1 = TextEditingController();
  final TextEditingController _meaning2 = TextEditingController();
  final TextEditingController _example = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  TextEditingController get word => _word;
  TextEditingController get origin => _origin;
  TextEditingController get meaning1 => _meaning1;
  TextEditingController get meaning2 => _meaning2;
  TextEditingController get example => _example;
  TextEditingController get textController => _textController;
}
