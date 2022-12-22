import 'package:get_it/get_it.dart';

import 'core/helpers/hive/hive_helper.dart';
import 'core/navigation/contract/base_navigation_service.dart';
import 'core/navigation/navigation_service.dart';
import 'data/contract/word_service.dart';
import 'data/service/word_service_local_imp.dart';
import 'data/service/word_service_remote_imp.dart';
import 'domain/repository/local_word_repository.dart';
import 'domain/repository/remote_word_repository.dart';
import 'domain/usecase/local_word_usecase.dart';
import 'domain/usecase/remote_word_usecase.dart';
import 'presentation/feature/home/controller/accent_controller.dart';
import 'presentation/feature/search_result/cubit/search_cubit.dart';
import 'presentation/feature/word_of_the_day/cubit/word_of_the_day_cubit.dart';

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

  getIt.registerLazySingleton<SearchCubit>(
    () => SearchCubit(),
  );

  getIt.registerLazySingleton<WordOfTheDayCubit>(
    () => WordOfTheDayCubit(),
  );

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
