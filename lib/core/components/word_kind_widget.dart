import '../../global/export/export.dart';

class WordKindWidget extends StatelessWidget {
  const WordKindWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final WordCubitContract cubit;

  @override
  Widget build(BuildContext context) {
    final tabCubit = getIt.call<TabCubit>();
    return BlocBuilder<TabCubit, TabState>(
      bloc: tabCubit,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            tabCubit.state.index == 0
                ? DictionaryWidget(
                    definitions: cubit.noun,
                  )
                : const SizedBox(),
            tabCubit.state.index == 1
                ? DictionaryWidget(
                    definitions: cubit.pronoun,
                  )
                : const SizedBox(),
            tabCubit.state.index == 2
                ? DictionaryWidget(
                    definitions: cubit.articles,
                  )
                : const SizedBox(),
            tabCubit.state.index == 3
                ? DictionaryWidget(
                    definitions: cubit.interjection,
                  )
                : const SizedBox(),
            tabCubit.state.index == 4
                ? DictionaryWidget(
                    definitions: cubit.verb,
                  )
                : const SizedBox(),
            tabCubit.state.index == 5
                ? DictionaryWidget(
                    definitions: cubit.adverb,
                  )
                : const SizedBox(),
            tabCubit.state.index == 6
                ? DictionaryWidget(
                    definitions: cubit.preposition,
                  )
                : const SizedBox(),
            tabCubit.state.index == 7
                ? DictionaryWidget(
                    definitions: cubit.adjective,
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
