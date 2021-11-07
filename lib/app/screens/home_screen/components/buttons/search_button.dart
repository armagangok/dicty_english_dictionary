import 'package:flutter/material.dart';

class SearchWordButtonWidget extends StatelessWidget {
  final Function onPressed;
  const SearchWordButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed(),
      icon: Icon(Icons.search, size: 30),
    );
  }
}
