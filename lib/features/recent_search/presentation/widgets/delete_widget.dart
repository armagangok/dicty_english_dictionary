import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';

class DeleteWidget extends StatefulWidget {
  const DeleteWidget({Key? key}) : super(key: key);

  @override
  State<DeleteWidget> createState() => _DeleteWidgetState();
}

class _DeleteWidgetState extends State<DeleteWidget> {
  late final RecentCubit _recentCubit;
  late final LocalCubit _localCubit;

  @override
  void initState() {
    _recentCubit = Injection.recentCubit;
    _localCubit = Injection.localCubit;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => BlocBuilder<RecentCubit, RecentState>(
        bloc: _recentCubit,
        builder: (context, state) {
          return AnimatedContainer(
            height: _recentCubit.isEditting ? context.height(0.07) : 0,
            color: const Color.fromARGB(255, 141, 160, 255).withOpacity(0.2),
            duration: const Duration(milliseconds: 300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _deleteButton,
                _deleteAllButton,
              ],
            ),
          );
        },
      ),
    );
  }

  TextButton get _deleteAllButton => TextButton(
        onPressed: () async {
          showDialog(
              context: context,
              builder: (context) {
                return IosDeleteDialog(
                  title: "Warning",
                  message: "Do you want to delete all items?",
                  dialogAction: () async {
                    await _localCubit.deleteAllWords();
                  },
                );
              });
        },
        child: const Text(
          KString.deleteAll,
          style: TextStyle(color: Colors.red),
        ),
      );

  Widget get _deleteButton => TextButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) {
              return IosDeleteDialog(
                title: "Warning",
                message: "Do you want to delete selected items?",
                dialogAction: () async => await _localCubit.deleteIfSelected(),
              );
            },
          );
        },
        child: const Text(
          KString.delete,
          style: TextStyle(color: Colors.red),
        ),
      );
}
