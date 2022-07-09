import 'package:flutter/material.dart';

import '../../feature/export/export.dart';

class DetailsView extends StatelessWidget {
  final HiveWord data;

  const DetailsView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(),
    );
  }
}
