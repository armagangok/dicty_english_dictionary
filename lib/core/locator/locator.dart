import 'package:get_it/get_it.dart';
import '../remote/api/services/current_service.dart';
import '../remote/api/services/dummy_service.dart';
import '../remote/api/repository/repository.dart';

final GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => CurrentService());
  locator.registerLazySingleton(() => DummyService());
  locator.registerLazySingleton(() => WordRepository());
}
