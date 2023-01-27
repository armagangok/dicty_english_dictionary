import 'package:flutter/material.dart';

import '../../global/export/export.dart';

class PhoneticsWidget extends StatelessWidget {
  const PhoneticsWidget({
    Key? key,
    required this.wordModel,
  }) : super(key: key);

  final WordResponse wordModel;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => wordModel.phonetics == null
          ? const SizedBox()
          : ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: context.height(0.035),
                minHeight: 0,
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: context.lowWidth,
                ),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: wordModel.phonetics == null
                    ? 0
                    : wordModel.phonetics!.length,
                itemBuilder: (context, index) =>
                    wordModel.phonetics![index].text == null
                        ? const SizedBox()
                        : Center(
                            child: Text(
                              wordModel.phonetics![index].text ?? "null list",
                              style: context.textTheme.bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
              ),
            ),
    );
  }
}
