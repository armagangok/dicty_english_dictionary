import '../../../../../global/export/export.dart';

class ThemePickerWidget extends StatelessWidget {
  const ThemePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = getIt.call<ThemeCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          child: Text(
            "Dark Mode",
            style: context.textTheme.headline1!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            maxLines: 1,
          ),
        ),
        BlocConsumer<ThemeCubit, ThemeState>(
          bloc: themeController,
          listener: (context, state) {},
          builder: (context, state) {
            return CupertinoSwitch(
              value: themeController.isDarkMode,
              onChanged: (value) async {
                await themeController.saveThemeMode(value);
                // ThemeService.instance.changeTheme();
              },
            );
          },
        ),
      ],
    );
  }
}
