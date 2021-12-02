import 'package:flutter/material.dart';
import 'view_home/components/scaffold_body_widget/widgets/future_builder_widget.dart';
import 'view_home/view_home.dart';


class SearchResultView extends StatelessWidget {
  const SearchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilderWidget(wordInfo: wordInfo),
            

          ],
        ),
      ),
    );
  }
}
