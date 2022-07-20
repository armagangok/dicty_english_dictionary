import '../../feature/export/export.dart';

class GiftView extends StatelessWidget {
  const GiftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(context.width(0.05)),
          children: [
            Center(
              child: Text(
                "Special page feature will be enabled soon! \n\nThanks for your patience!",
                style: context.textTheme.headline6!.copyWith(
                  shadows: [
                    const Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 5,
                      color: Color.fromARGB(255, 73, 73, 73),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
