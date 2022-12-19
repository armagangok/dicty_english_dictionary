import 'package:get_it/get_it.dart';

import 'core/navigation/contract/base_navigation_service.dart';
import 'core/navigation/navigation_service.dart';
import 'feature/data/contract/word_repository.dart';
import 'global/export/export.dart';

var getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton<WordRepository>(
    () => WordRepositoryImp.instance,
  );
  getIt.registerLazySingleton<NavigationServiceContract>(
    () => NavigationService.instance,
  );
  getIt.registerLazySingleton<WordRepositoryImp>(
    () => WordRepositoryImp.instance,
  );
  getIt.registerLazySingleton<AccentController>(
    () => AccentController.instance,
  );
  getIt.registerLazySingleton<WordOfTheDayController>(
    () => WordOfTheDayController.instance,
  );
}
