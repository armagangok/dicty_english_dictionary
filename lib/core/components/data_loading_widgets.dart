import 'package:auto_size_text/auto_size_text.dart';
import 'package:english_accent_dictionary/global/constant/app_color/app_color.dart';
import 'package:english_accent_dictionary/global/constant/asset_consants.dart';

import '../../feature/export/export.dart';
import '../remote/api/model/model.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    Key? key,
    required this.errorModel,
  }) : super(key: key);

  final ErrorModel errorModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.symmetricPadding(horizontal: 0.025),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetConstant.searchIcon),
            Text(
              errorModel.title,
              style: context.textTheme.titleLarge!.copyWith(
                color: AppColor.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
            AutoSizeText(
              errorModel.message,
              style: context.textTheme.titleSmall!
                  .copyWith(color: AppColor.primaryColor),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class WaitingForDataWidget extends StatelessWidget {
  const WaitingForDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              "Fetching data from source...",
              style: context.textTheme.headline6,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
