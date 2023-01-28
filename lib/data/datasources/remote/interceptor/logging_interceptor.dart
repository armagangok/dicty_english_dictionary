import '../../../../global/export/export.dart';

class LoggerInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LogHelper.shared.debugPrint('INTERCEPTOR RESPONSE : $response');

    // Injection.logger.debugPrint('RESPONSE TYPE : ${response.runtimeType}');
    // Injection.logger.debugPrint('PATH : ${response.requestOptions.path}');
    // Injection.logger.debugPrint('REQUEST METHOD : ${response.requestOptions.method}');
    // Injection.logger.debugPrint('REQUEST_DATA : \n${response.requestOptions.data}');
    // Injection.logger.debugPrint('RESPONSE_DATA : \n${response.data}');
    handler.next(response);
  }
}
