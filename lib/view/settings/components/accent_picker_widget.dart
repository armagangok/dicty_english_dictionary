import '../../../feature/export/export.dart';
import '../controller/accent_controller.dart';

class AccentPickerWidget extends StatelessWidget {
  final List<String> items = const [
    'English-GB',
    'English-US',
    'English-IE',
    'English-AU',
    'English-IN',
    'English-ZA',
  ];

  const AccentPickerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AccentController accentController = Get.put(AccentController());

    return SizedBox(
      height: context.height(0.2),
      width: double.minPositive,
      child: Obx(
        () {
          switch (accentController.value.value) {
            case null:
              return const SizedBox();

            case -1:
              return const Center(child: Text("Unknown Error"));

            default:
              return CupertinoPicker(
                scrollController: FixedExtentScrollController(
                    initialItem: accentController.value.value!),
                useMagnifier: true,
                magnification: 1.1,
                itemExtent: 40,
                onSelectedItemChanged: (value) async {
                  await accentController.saveAccent(value);
                },
                children: items
                    .map(
                      (item) => Center(child: Text(item)),
                    )
                    .toList(),
              );
          }
        },
      ),
    );
  }
}
