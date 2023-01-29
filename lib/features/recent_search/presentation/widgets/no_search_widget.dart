import '../../../../global/export/export.dart';

class NoRecentSearchWidget extends StatelessWidget {
  const NoRecentSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.lowPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyErrorWidget(
              errorModel: ErrorModel(
                title: KString.resultViewSearchTitle,
                message: KString.resultViewResultMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
