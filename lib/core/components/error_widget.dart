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
              Padding(
                padding: const EdgeInsets.only(bottom: 76),
                child: SizedBox(
                  child: Padding(
                    padding: context.bigPadding,
                    child: AutoSizeText(
                      errorModel.message,
                      style: context.textTheme.titleSmall!
                          .copyWith(color: context.primary),
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
