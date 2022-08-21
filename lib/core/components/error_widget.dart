import 'package:flutter/material.dart';

import '../../feature/export/export.dart';
import '../remote/api/model/model.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({
    Key? key,
    required this.errorModel,
  }) : super(key: key);

  final ErrorModel errorModel;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: context.symmetricPadding(horizontal: 0.025),
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              Column(
                children: [
                  _errorIcon,
                  warningTitle,
                  _warningMessage,
                ],
              ),
            ],
          ),
        ),
      );

  Widget get _warningMessage => Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: kToolbarHeight),
          child: SizedBox(
            child: AutoSizeText(
              errorModel.message,
              style: context.textTheme.titleSmall!
                  .copyWith(color: context.primary),
              maxLines: 2,
            ),
          ),
        );
      });

  Widget get warningTitle => Builder(builder: (context) {
        return Text(
          errorModel.title,
          style: context.textTheme.titleLarge!.copyWith(
            color: AppColor.deepOrange,
          ),
        );
      });

  Image get _errorIcon => Image.asset(AssetConstant.searchIcon);
}
