import '../../../feature/export/export.dart';

class SlideActionWidget extends StatelessWidget {
  final Word? data;
  final IconData? icon;
  final Color? bgColor;
  final String? iconText;
  final Function? onTap;

  const SlideActionWidget({
    Key? key,
    this.data,
    this.icon,
    this.bgColor,
    this.iconText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: IconSlideAction(
        caption: '$iconText',
        color: bgColor,
        icon: icon,
        onTap: () => onTap!(),
      ),
    );
  }
}
