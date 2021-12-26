import 'package:english_accent_dictionary/core/local/database/repository/repository.dart';
import 'package:english_accent_dictionary/core/local/database/services/current_service.dart';
import 'package:english_accent_dictionary/core/local/database/services/dummy_service.dart';
import 'package:get_it/get_it.dart';
import '../remote/api/services/current_service.dart';
import '../remote/api/services/dummy_service.dart';
import '../remote/api/repository/repository.dart';

final GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => CurrentApiService());
  locator.registerLazySingleton(() => DummyApiService());
  locator.registerLazySingleton(() => WordRepository());
  locator.registerLazySingleton(() => CurrentDBService());
  locator.registerLazySingleton(() => DatabaseDummyService());
  locator.registerLazySingleton(() => WordDBRepository());


}
