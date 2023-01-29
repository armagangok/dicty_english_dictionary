
import '../export/export.dart';

var getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton<NavigationService>(
    () => NavigationServiceImp.instance,
  );

  // getIt.registerLazySingleton<AccentCubit>(
  //   () => AccentCubit(),
  // );

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

  getIt.registerLazySingleton<RecentSearchUsecase>(
    () => RecentSearchUsecase(),
  );

  getIt.registerLazySingleton<TabCubit>(
    () => TabCubit(),
  );

  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(),
  );
  getIt.registerLazySingleton<RecentCubit>(
    () => RecentCubit(),
  );
  getIt.registerLazySingleton<LocalCubit>(
    () => LocalCubit(),
  );
}
