
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../local/database/viewmodels/word_viewmodel.dart';
import '../remote/api/viewmodels/word_viewmodels.dart';

List<SingleChildWidget> multiProvider(context) {
  return [
      ChangeNotifierProvider<WordViewModelAPI>(
    create: (_) => WordViewModelAPI(),
  ),
  ChangeNotifierProvider<WordViewModel>(create: (_) => WordViewModel()),
  ];
}