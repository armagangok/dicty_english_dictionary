import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';

class MyBlinkingButton extends StatefulWidget {
  const MyBlinkingButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  final Function onTap;
  final String text;

  @override
  _MyBlinkingButtonState createState() => _MyBlinkingButtonState();
}

class _MyBlinkingButtonState extends State<MyBlinkingButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: TextButton(
        onPressed: () => widget.onTap(),
        child: Text(
          widget.text,
          style: context.textTheme.bodySmall,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
