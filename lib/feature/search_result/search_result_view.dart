import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/navigation/contract/base_navigation_service.dart';
import '../../../../global/export/export.dart';
import 'search/search_cubit.dart';

class SearchResultView extends StatefulWidget {
  const SearchResultView({Key? key}) : super(key: key);

  @override
  State<SearchResultView> createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView> {
  @override
  void initState() {
    navigator = getIt<NavigationServiceContract>.call();

    _searchCubit = getIt.call<SearchCubit>();
    _hiveService = HiveController.instance;
    super.initState();
  }

  late final _hiveService;
  
  late final navigator;
  late final _searchCubit;

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
              wordModel: state.wordModel,
              controller: _searchCubit,
            );
          } else {
            return const Center(
              child: Text("laskjdhlasdkljasldk"),
            );
          }
        },
      );
}
