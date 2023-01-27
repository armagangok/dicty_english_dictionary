import 'global/export/export.dart';
import 'features/root.dart';

void main() async {
  await Initialization.instance.initApp();
  runApp(const AppRoot());
}
