import '../features/recent_search/presentation/cubit/recent/recent_cubit.dart';
import 'export/export.dart';

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

  // getIt.registerLazySingleton<WordOfTheDayCubit>(
  //   () => WordOfTheDayCubit(),
  // );

  getIt.registerLazySingleton<HiveHelper>(
    () => HiveHelper.shared,
  );

  // getIt.registerLazySingleton<LocalWordUsecase>(
  //   () => LocalWordUsecase(repository: localWordRepository),
  // );

  getIt.registerLazySingleton<TabCubit>(
    () => TabCubit(),
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
  // getIt.registerLazySingleton<LocalCubit>(
  //   () => LocalCubit(),
  // );
}
