import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/remote/api/viewmodels/word_viewmodels.dart';
import '../../../../global/components/common/textfields.dart';
import '../../../../global/controllers/text_editing_controllers.dart';
import '../../../../global/navigation/navigation.dart';
import '../../../view_search_result.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WordViewModelAPI _wordViewModel =
        Provider.of<WordViewModelAPI>(context);
    return Expanded(
      child: CustomTextField(
        controller: controllers.search,
        icon: const Icon(Icons.search),
        onTap: () => {
          wordInfo = _wordViewModel.fetchData(controllers.search.text),
          navigate(const SearchResultView(), context),
          controllers.search.clear(),
        },
      ),
    );
  }
}