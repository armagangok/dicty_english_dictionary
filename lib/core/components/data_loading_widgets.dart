import '../../feature/export/export.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("An error occured while fetching data."),
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
