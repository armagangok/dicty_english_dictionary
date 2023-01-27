import 'package:flutter/material.dart';

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



class ExpandedItem2 extends StatelessWidget {
  const ExpandedItem2({
    Key? key,
    required this.tabCubit,
    required this.cubit,
  }) : super(key: key);

  final TabCubit tabCubit;
  final WordCubitContract cubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ExpandedItem(
            text: "Verb",
            clickedNumber: 4,
            onTap: () => tabCubit.changeIndex(4),
            amount: cubit.verb.length,
          ),
          ExpandedItem(
            text: "Adverb",
            clickedNumber: 5,
            onTap: () => tabCubit.changeIndex(5),
            amount: cubit.adverb.length,
          ),
          ExpandedItem(
            text: "Preposition",
            clickedNumber: 6,
            onTap: () => tabCubit.changeIndex(6),
            amount: cubit.preposition.length,
          ),
          ExpandedItem(
            text: "Adjecive",
            clickedNumber: 7,
            onTap: () => tabCubit.changeIndex(7),
            amount: cubit.adjective.length,
          ),
        ],
      ),
    );
  }
}

class ExpandedItemWidget1 extends StatelessWidget {
  const ExpandedItemWidget1({
    Key? key,
    required this.tabCubit,
    required this.controller,
  }) : super(key: key);

  final TabCubit tabCubit;
  final WordCubitContract controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ExpandedItem(
            text: "Noun",
            clickedNumber: 0,
            onTap: () => tabCubit.changeIndex(0),
            amount: controller.noun.length,
          ),
          ExpandedItem(
            text: "Pronoun",
            clickedNumber: 1,
            onTap: () => tabCubit.changeIndex(1),
            amount: controller.pronoun.length,
          ),
          ExpandedItem(
            text: "Articles",
            clickedNumber: 2,
            onTap: () => tabCubit.changeIndex(2),
            amount: controller.articles.length,
          ),
          ExpandedItem(
            text: "Interjection",
            clickedNumber: 3,
            onTap: () => tabCubit.changeIndex(3),
            amount: controller.interjection.length,
          ),
        ],
      ),
    );
  }
}
