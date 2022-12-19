import 'package:dio/dio.dart';

class MyRequestOptions {
  MyRequestOptions._();
  static final instance = MyRequestOptions._();

  RequestOptions requestOptions({
    required String text,
  }) =>
      RequestOptions(
        baseUrl: 'https://api.dictionaryapi.dev/api/v2/entries/en/',
        path: text,
      );
}
