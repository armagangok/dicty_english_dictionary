import '../../../core/remote/api/models/word_model.dart';
import '../../../feature/export/export.dart';

class SlideActionWidget extends StatelessWidget {
  final WordModel? data;
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
