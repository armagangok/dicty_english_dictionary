import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Widget? textWidget;
  const ContainerWidget({
    Key? key,
    this.textWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.17,
      alignment: Alignment.center,
      child: textWidget,
    );
  }
}
