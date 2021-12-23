import 'package:get_it/get_it.dart';
import '../api/services/current_service.dart';
import '../api/services/dummy_service.dart';
import '../repositories/repository.dart';

final GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => CurrentService());
  locator.registerLazySingleton(() => DummyService());
  locator.registerLazySingleton(() => WordRepository());
}
