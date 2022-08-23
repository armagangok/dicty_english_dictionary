
import '../../../global/export/export.dart';


class ThemePickerWidget extends StatelessWidget {
  const ThemePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Injection.instance.locator.get<ThemeController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          child: Text(
            "Dark Mode",
            style: context.textTheme.headline1!
                .copyWith(fontSize: 20, fontWeight: FontWeight.normal),
            maxLines: 1,
          ),
        ),
        Obx(
          () {
            return CupertinoSwitch(
              value: themeController.switchValue.value,
              onChanged: (value) {
                themeController.change(value);
                ThemeService.instance.changeTheme();
              },
            );
          },
        ),
      ],
    );
  }
}
