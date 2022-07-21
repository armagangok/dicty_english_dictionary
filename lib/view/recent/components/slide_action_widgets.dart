import '../../../feature/export/export.dart';

class SlideActionWidget extends StatelessWidget {
  final HiveWord? data;
  final IconData? iconData;
  final Color? bgColor;
  final String? iconText;
  final Function? onTap;

  const SlideActionWidget({
    Key? key,
    this.data,
    this.iconData,
    this.bgColor,
    this.iconText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconSlideAction(
      caption: '$iconText',
      color: bgColor,
      icon: iconData,
      onTap: () => onTap!(),
    );
  }
}
