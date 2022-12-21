import 'package:get_it/get_it.dart';

import 'core/navigation/contract/base_navigation_service.dart';
import 'core/navigation/navigation_service.dart';
import 'data/contract/word_service.dart';
import 'data/service/word_service_imp.dart';
import 'domain/repository/repository.dart';
import 'domain/usecase/word_usecase.dart';
import 'feature/home/controller/accent_controller.dart';
import 'feature/search_result/search/search_cubit.dart';
import 'feature/word_of_the_day/controller/word_of_the_day_controller.dart';
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


}
