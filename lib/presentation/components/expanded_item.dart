import 'package:english_accent_dictionary/presentation/controller/tabbar_cubit/tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global/export/export.dart';

class ExpandedItem extends StatelessWidget {
  ExpandedItem({
    Key? key,
    required this.clickedNumber,
    required this.text,
    required this.amount,
    required this.onTap,
  }) : super(key: key);

  final Function onTap;
  final int clickedNumber;
  final String text;
  final int amount;

  final TabCubit _tabCubit = getIt.call<TabCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TabCubit, TabState>(
      bloc: _tabCubit,
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () => onTap(),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.colors.onBackground,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(90),
              ),
              color: clickedNumber == state.index
                  ? context.colors.onBackground
                  : Colors.transparent,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.width(0.01),
              vertical: context.height(0.006),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    color: clickedNumber == state.index
                        ? Colors.white
                        : context.primary,
                  ),
                ),
                Text(
                  "($amount)",
                  style: TextStyle(
                    color: clickedNumber == state.index
                        ? Colors.white
                        : context.primary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
