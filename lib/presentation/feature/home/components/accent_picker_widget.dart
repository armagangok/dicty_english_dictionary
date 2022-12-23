import '../../../../../global/export/export.dart';
import '../cubit/accent/accent_cubit.dart';

class AccentPickerWidget extends StatelessWidget {
  final List<String> items = const [
    'English-GB',
    'English-US',
    'English-IE',
    'English-AU',
    'English-IN',
    'English-ZA',
  ];

  final accentCubit = getIt<AccentCubit>.call();
  AccentPickerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height(0.2),
      width: double.minPositive,
      child: BlocConsumer<AccentCubit, AccentState>(
        bloc: accentCubit,
        listener: (context, state) {},
        builder: (context, state) {
          print(state.accent);
          return CupertinoPicker(
            scrollController: FixedExtentScrollController(
              initialItem: state.accent,
              // items.indexOf("${state.accent}"),
            ),
            useMagnifier: true,
            magnification: 1.2,
            itemExtent: 50,
            onSelectedItemChanged: (value) async {
              await accentCubit.saveAccent(value);
            },
            children: items
                .map((item) => Center(
                      child: Text(item, style: context.textTheme.bodyText1),
                    ))
                .toList(),
          );
          // if (state is AccentFetched) {
          //   print("Accent number: " "${state.accent}");

          // } else {
          //   return const Text("data");
          // }
          // switch (accentCubit.accent) {
          //   case null:
          //     return const SizedBox();

          //   case -1:
          //     return const Center(
          //       child: Text("Unknown Error"),
          //     );

          //   default:
          //     return CupertinoPicker(
          //       scrollController: FixedExtentScrollController(
          //         initialItem: items.indexOf("${accentCubit.accent.value}"),
          //       ),
          //       useMagnifier: true,
          //       magnification: 1.2,
          //       itemExtent: 50,
          //       onSelectedItemChanged: (value) async {
          //         await accentCubit.saveAccent(items[value]);
          //       },
          //       children: items
          //           .map((item) => Center(
          //                   child: Text(
          //                 item,
          //                 style: context.textTheme.bodyText1,
          //               )))
          //           .toList(),
          //     );
          // }
        },
      ),
    );
  }
}
