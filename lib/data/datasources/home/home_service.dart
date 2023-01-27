import 'package:english_accent_dictionary/data/models/request/word_request.dart';
import 'package:english_accent_dictionary/data/models/response/word_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../global/export/export.dart';

part 'home_service.g.dart';

const BASE_API_URL = "https://api.dictionaryapi.dev/api/v2/entries/en";

@RestApi(baseUrl: BASE_API_URL)
abstract class HomeClient {
  factory HomeClient(Dio dio, {String baseUrl}) = _HomeClient;

  @POST("")
  Future<WordResponse> fetchWord(
    @Body() WordRequest request,
  );
}
