import 'package:get_it/get_it.dart';

import 'core/navigation/contract/base_navigation_service.dart';
import 'core/navigation/navigation_service.dart';
import 'feature/data/contract/word_service.dart';
import 'feature/domain/repository/repository.dart';
import 'feature/domain/usecase/word_usecase.dart';

import 'feature/presentation/page/search_result/search/search_cubit.dart';
import 'global/export/export.dart';

var getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton<WordService>(
    () => WordServiceImp.instance,
  );

  getIt.registerLazySingleton<NavigationServiceContract>(
    () => NavigationService.instance,
  );

  getIt.registerLazySingleton<AccentController>(
    () => AccentController.instance,
  );

  getIt.registerLazySingleton<BaseWordController>(
    () => WordOfTheDayController.instance,
  );

  getIt.registerLazySingleton<WordUsecase>(
    () => WordUsecase(repository: WordRepository.instance),
  );

  getIt.registerLazySingleton<SearchCubit>(
    () => SearchCubit(),
  );

  getIt.registerLazySingleton<WordUsecase>(
    () => WordUsecase(repository: WordRepository.instance),
  );
}
