import '../../../global/export/export.dart';
import 'home/home_service.dart';
import 'interceptor/logging_interceptor.dart';

class Api {
  static final Api _api = Api._();
  Api._();
  factory Api() => _api;

  String get _baseApiUrl => BASE_API_URL;

  late final HomeClient homeClient = HomeClient(
    dio,
    baseUrl: _baseApiUrl,
  );

  Dio? _dio;

  Dio get dio {
    _dio ??= Dio()
      ..options.connectTimeout = 120000
      ..options.receiveTimeout = 120000
      ..interceptors.addAll(
        [
          LoggingInterceptor(),
        ],
      );
    return _dio!;
  }
}
