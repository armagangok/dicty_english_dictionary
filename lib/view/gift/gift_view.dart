import '../../feature/export/export.dart';

class GiftView extends StatelessWidget {
  const GiftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(context.width(0.05)),
        children: [
          Center(
            child: Text(
              "Special page feature will be enabled soon! \n\nThank for you patience!",
              style: context.textTheme.headline5,
            ),
          )
        ],
      ),
    );
  }
}
