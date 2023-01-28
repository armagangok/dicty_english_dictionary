import 'package:retrofit/retrofit.dart';

import '../../../global/export/export.dart';

part 'home_service.g.dart';

const baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/en/";

@RestApi(baseUrl: baseUrl)
abstract class HomeClient {
  factory HomeClient(Dio dio) = _HomeClient;

  @GET("{word}")
  Future<List<WordResponse>> fetchWord(@Path("word") String word);
}
