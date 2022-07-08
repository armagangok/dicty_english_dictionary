

import 'package:flutter/material.dart';

import '../../../feature/export/export.dart';

class AccentPickerWidget extends StatelessWidget {
  final List<String> items = [
    'English-GB',
    'English-US',
    'English-IE',
    'English-AU',
    'English-IN',
    'English-ZA',
  ];

  AccentPickerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final WordViewModel _wordViewModel = WordViewModel();
    return FutureBuilder(
      future: _wordViewModel.getLanguage(),
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("English Accent"),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width / 4,
                child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: snapshot.data!),
                  useMagnifier: true,
                  magnification: 1.1,
                  itemExtent: 30,
                  onSelectedItemChanged: (value) async {
                    await _wordViewModel.saveLanguage(value);
                  },
                  children:
                      items.map((item) => CustomText(data: item)).toList(),
                ),
              ),
            ],
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
