// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';

class RecentDetailPage extends StatelessWidget {
  const RecentDetailPage({
    Key? key,
    required this.wordModel,
  }) : super(key: key);

  final WordResponse wordModel;

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
        onTap: () => Injection.navigator.getBack(),
      );

  Widget get _buildBody => BlocBuilder<LocalCubit, LocalState>(
        bloc: Injection.localCubit,
        builder: (context, state) {
          if (state is LocalFailed) {
            return MyErrorWidget(
              errorModel: ErrorModel(
                message: state.errorMessage,
                title: state.errorTitle,
              ),
            );
          } else {
            return WordWidget(
              wordModel: wordModel,
              cubit: Injection.localCubit,
              tabCubit: Injection.tabCubit,
            );
          }
        },
      );
}
