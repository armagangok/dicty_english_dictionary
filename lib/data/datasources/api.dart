import '../../../global/export/export.dart';
import 'home/home_service.dart';
import 'interceptor/logging_interceptor.dart';

class Api {
  static final Api _api = Api._();
  Api._();
  factory Api() => _api;

  late final HomeClient homeClient = HomeClient(dio);

  Dio? _dio;

  Dio get dio {
    _dio ??= Dio()
      ..options.connectTimeout = 120000
      ..options.receiveTimeout = 120000
      ..interceptors.addAll(
        [
          LoggerInterceptor(),
        ],
      );
    return _dio!;
  }
}
