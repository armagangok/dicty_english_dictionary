import 'package:flutter/material.dart';

import '../../../../../global/export/export.dart';
import '../cubit/accent/accent_cubit.dart';

class AccentPickerWidget extends StatelessWidget {
  const AccentPickerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int selectedItem = 0;
    return SizedBox(
      height: context.height(0.27),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<AccentCubit, AccentState>(
            bloc: getIt<AccentCubit>.call(),
            // listener: (context, state) {},
            builder: (context, state) => SizedBox(
              height: context.height(0.2),
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                  initialItem: getIt<AccentCubit>.call().accent,
                ),
                useMagnifier: true,
                magnification: 1.2,
                itemExtent: 50,
                onSelectedItemChanged: (value) async => selectedItem = value,
                children: items
                    .map(
                      (item) => Center(
                        child: Text(
                          item,
                          style: context.textTheme.bodyText1,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await getIt<AccentCubit>.call().saveAccent(selectedItem);
            },
            child: Text(
              "Save",
              style: context.textTheme.headline5,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

const List<String> items = [
  'English-GB',
  'English-US',
  'English-IE',
  'English-AU',
  'English-IN',
  'English-ZA',
];
