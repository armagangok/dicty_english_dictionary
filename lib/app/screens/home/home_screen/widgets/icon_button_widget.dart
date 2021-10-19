import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final  routeName;

  final Icon icon;

  const IconButtonWidget({
    Key? key,
    required this.routeName,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => routeName),
        );
      },
      icon: icon,
    );
  }
}
