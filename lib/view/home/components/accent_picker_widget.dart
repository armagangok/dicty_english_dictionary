import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../../global/export/export.dart';

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
          switch (accentController.accent.value) {
            case null:
              return const SizedBox();

            case -1:
              return const Center(child: Text("Unknown Error"));

            default:
              return CupertinoPicker(
                
                scrollController: FixedExtentScrollController(
                  initialItem:
                      items.indexOf("${accentController.accent.value}"),
                ),
                useMagnifier: true,
                magnification: 1.2,
                itemExtent: 50,
                onSelectedItemChanged: (value) async {
                  await accentController.saveAccent(items[value]);
                },
                children: items
                    .map((item) => Center(
                            child: Text(
                          item,
                          style: context.textTheme.bodyText1,
                        )))
                    .toList(),
              );
          }
        },
      ),
    );
  }
}
