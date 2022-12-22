import 'package:english_accent_dictionary/core/helpers/hive/hive_helper.dart';
import 'package:english_accent_dictionary/data/service/word_service_local_imp.dart';
import 'package:english_accent_dictionary/domain/usecase/local_word_usecase.dart';
import 'package:english_accent_dictionary/feature/word_of_the_day/cubit/word_of_the_day_cubit.dart';
import 'package:get_it/get_it.dart';

import 'core/navigation/contract/base_navigation_service.dart';
import 'core/navigation/navigation_service.dart';
import 'data/contract/word_service.dart';
import 'data/service/word_service_remote_imp.dart';
import 'domain/repository/local_word_repository.dart';
import 'domain/repository/remote_word_repository.dart';
import 'domain/usecase/remote_word_usecase.dart';
import 'feature/home/controller/accent_controller.dart';
import 'feature/search_result/search/search_cubit.dart';
import 'feature/word_of_the_day/controller/word_of_the_day_controller.dart';
import 'global/export/export.dart';

var getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton<WordService>(
    () => WordServiceRemoteImp(),
  );

  getIt.registerLazySingleton<NavigationServiceContract>(
    () => NavigationService.instance,
  );

  getIt.registerLazySingleton<AccentController>(
    () => AccentController.instance,
  );

  // getIt.registerLazySingleton<BaseWordController>(
  //   () => WordOfTheDayController.instance,
  // );

  getIt.registerLazySingleton<SearchCubit>(
    () => SearchCubit(),
  );

  getIt.registerLazySingleton<WordOfTheDayCubit>(
    () => WordOfTheDayCubit(),
  );

  // getIt.registerLazySingleton<WordOfTheDayController>(
  //   () => WordOfTheDayController.instance,
  // );

  getIt.registerLazySingleton<HiveHelper>(
    () => HiveHelper.shared,
  );

  getIt.registerLazySingleton<LocalWordRepository>(
    () => LocalWordRepository(
      service: WordServiceLocalImp(),
    ),
  );

  getIt.registerLazySingleton<RemoteWordRepository>(
    () => RemoteWordRepository(service: WordServiceRemoteImp()),
  );

  getIt.registerLazySingleton<LocalWordUsecase>(
    () => LocalWordUsecase(
      repository: getIt.call<LocalWordRepository>(),
    ),
  );

  getIt.registerLazySingleton<RemoteWordUsecase>(
    () => RemoteWordUsecase(
      repository: RemoteWordRepository(
        service: getIt.call<WordService>(),
      ),
    ),
  );
}
