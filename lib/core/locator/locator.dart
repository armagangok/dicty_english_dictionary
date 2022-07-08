import 'package:get_it/get_it.dart';

import '../local/database/repository/repository.dart';
import '../local/database/services/current_service.dart';
import '../local/database/services/dummy_service.dart';
import '../remote/api/services/current_service.dart';
import '../remote/api/services/dummy_service.dart';

final GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => WordService());
  locator.registerLazySingleton(() => DummyApiService());
  locator.registerLazySingleton(() => CurrentDBService());
  locator.registerLazySingleton(() => DatabaseDummyService());
  locator.registerLazySingleton(() => WordDBRepository());
}
