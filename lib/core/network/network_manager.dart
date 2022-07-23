// import 'dart:io';

// import 'package:dio/dio.dart';

// import '../base/model/base_model.dart';
// import '../initialization/cache/constants.dart';
// import '../initialization/cache/locale_manager.dart';
// import 'ICoreDio.dart';
// import 'core_dio.dart';

// class NetworkManager {
//   static NetworkManager? _instance;
//   static NetworkManager? get instance {
//     _instance ??= NetworkManager._init();
//     return _instance;
//   }

//   ICoreDioNullSafety? coreDio;

//   NetworkManager._init() {
//     final baseOptions = BaseOptions(
//         baseUrl: 'https://jsonplaceholder.typicode.com/',
//         headers: {
//           'val': LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
//         });

//     coreDio = CoreDio(baseOptions);
//   }

//   final Dio _dio = Dio();

//   Future dioGet<T extends BaseModel>(String path, T model) async {
//     final response = await _dio.get(path);

//     switch (response.statusCode) {
//       case HttpStatus.ok:
//         final responseBody = response.data;

//         if (responseBody is List) {
//           return responseBody.map((e) => model.fromJson(e)).toList();
//         } else if (responseBody is Map) {
//           return model.fromJson(responseBody);
//         }
//         return responseBody;
//       default:
//     }
//   }
// }
