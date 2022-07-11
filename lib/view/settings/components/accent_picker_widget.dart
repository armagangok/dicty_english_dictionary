import 'package:flutter/material.dart';

import '../../../feature/export/export.dart';

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
    final WordViewModel _wordViewModel = WordViewModel();
    return FutureBuilder(
      future: _wordViewModel.getLanguage(),
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: context.height(0.2),
            width: double.minPositive,
            child: CupertinoPicker(
              scrollController:
                  FixedExtentScrollController(initialItem: snapshot.data!),
              useMagnifier: true,
              magnification: 1.1,
              itemExtent: 40,
              
              onSelectedItemChanged: (value) async {
                await _wordViewModel.saveLanguage(value);
              },
              children: items
                  .map(
                    (item) => Center(child: Text(item)),
                  )
                  .toList(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Text("${snapshot.error}"),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
