import 'package:flutter/material.dart';

import '../../../../../../global/export/export.dart';
import '../cubit/search_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    navigator = getIt<NavigationService>.call();

    _searchCubit = getIt.call<SearchCubit>();
    super.initState();
  }

  // late final _hiveService;
  late final NavigationService navigator;
  late final SearchCubit _searchCubit;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => context.dismissKeyboard(),
        child: Scaffold(
          appBar: _buildAppBar,
          body: _buildBody,
        ),
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: const Text("Result"),
        onTap: () => navigator.getBack(),
      );

  Widget get _buildBody => BlocConsumer<SearchCubit, SearchState>(
        bloc: _searchCubit,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SearchingState) {
            return const LoadingWidget();
          } else if (state is SearchFailed) {
            return MyErrorWidget(
              errorModel: ErrorModel(
                title: state.errorTitle,
                message: state.errorMessage,
              ),
            );
          } else if (state is SearchSucceded) {
            return WordWidget(
              wordModel: state.response,
              cubit: _searchCubit,
              tabCubit: getIt.call<TabCubit>(),
            );
          } else {
            return const Center(
              child: Text("laskjdhlasdkljasldk"),
            );
          }
        },
      );
}
