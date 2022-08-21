import 'package:flutter/material.dart';

import '../../feature/export/export.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Waiting for the data..."),
        SizedBox(height: context.normalHeight),
        const CircularProgressIndicator(),
      ],
    ));
  }
}
