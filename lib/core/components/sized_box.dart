import '../../feature/export/export.dart';

class SizedBox001 extends StatelessWidget {
  const SizedBox001({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height(0.02),
    );
  }
}
