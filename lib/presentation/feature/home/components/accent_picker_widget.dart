import 'package:flutter/material.dart';

import '../../../../../global/export/export.dart';

class AccentPickerWidget extends StatelessWidget {
  const AccentPickerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _accentCubit = getIt<AccentCubit>.call();
    int selectedItem = 0;
    return SizedBox(
      height: context.height(0.27),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocConsumer<AccentCubit, AccentState>(
            bloc: _accentCubit,
            listener: (context, state) {},
            builder: (context, state) {
              return SizedBox(
                height: context.height(0.2),
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                      initialItem: state.accentIndex),
                  useMagnifier: true,
                  magnification: 1.2,
                  itemExtent: 50,
                  onSelectedItemChanged: (value) async {
                    selectedItem = value;
                  },
                  children: items.map((item) {
                    return Center(
                        child: Text(
                      item,
                      style: context.textTheme.bodyText1,
                    ));
                  }).toList(),
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () async {
              await _accentCubit.saveAccent(selectedItem);
            },
            child: const Text("Save"),
          )
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
