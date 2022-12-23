import 'global/export/export.dart';
import 'presentation/root.dart';

void main() async {
  await Initialization.instance.initApp();
  runApp(const MyApp());
}
