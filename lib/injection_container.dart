import 'package:english_accent_dictionary/global/export/export.dart';
import 'package:english_accent_dictionary/presentation/controller/tabbar_cubit/tab_cubit.dart';
import 'package:english_accent_dictionary/presentation/feature/home/cubit/accent/accent_cubit.dart';
import 'package:get_it/get_it.dart';

import 'core/helpers/hive/hive_helper.dart';
import 'core/navigation/navigation_service.dart';
import 'data/contract/word_service.dart';
import 'data/service/word_service_local_imp.dart';
import 'data/service/word_service_remote_imp.dart';
import 'domain/repository/local_word_repository.dart';
import 'domain/repository/remote_word_repository.dart';
import 'presentation/feature/word_of_the_day/cubit/word_of_the_day_cubit.dart';

var getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton<WordService>(
    () => WordServiceRemoteImp(),
  );

  getIt.registerLazySingleton<NavigationServiceContract>(
    () => NavigationService.instance,
  );

  getIt.registerLazySingleton<AccentCubit>(
    () => AccentCubit(),
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
      service: WordServiceLocalImp.instance,
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

  getIt.registerLazySingleton<TabCubit>(
    () => TabCubit(),
  );

  getIt.registerLazySingleton<RemoteWordUsecase>(
    () => RemoteWordUsecase(
      repository: RemoteWordRepository(
        service: getIt.call<WordService>(),
      ),
    ),
  );
}
