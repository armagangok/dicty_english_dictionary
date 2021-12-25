import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../local/database/viewmodels/word_viewmodel.dart';
import '../remote/api/viewmodels/word_viewmodels.dart';

List<SingleChildWidget> multiProvider(context) {
  return [
    Provider<WordViewModelAPI>(create: (_) => WordViewModelAPI()),
    Provider<WordViewModel>(create: (_) => WordViewModel()),
  ];
}
