import 'package:english_accent_dictionary/presentation/feature/home/cubit/home/home_cubit.dart';
import 'package:english_accent_dictionary/presentation/feature/recent/cubit/recent/recent_cubit.dart';

import 'global/export/export.dart';
import 'presentation/feature/home/cubit/theme/theme_cubit_cubit.dart';

var getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton<WordService>(
    () => WordServiceRemoteImp(),
  );

  getIt.registerLazySingleton<NavigationService>(
    () => NavigationServiceImp.instance,
  );

  getIt.registerLazySingleton<AccentCubit>(
    () => AccentCubit(),
  );

  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(),
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

  getIt.registerLazySingleton<ThemeService>(
    () => ThemeServiceImp.instance,
  );
  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(),
  );
  getIt.registerLazySingleton<RecentCubit>(
    () => RecentCubit(),
  );
}
