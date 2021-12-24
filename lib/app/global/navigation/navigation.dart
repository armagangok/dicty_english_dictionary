import 'package:flutter/material.dart';

void navigate(routeName, context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => routeName),
  );
}
