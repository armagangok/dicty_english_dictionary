import 'package:english_accent_dictionary/global/export/export.dart';

import 'response_data/license/license.dart';
import 'response_data/meanings/meanings.dart';
import 'response_data/phonetics/phonetics.dart';

part 'word_response.freezed.dart';
part 'word_response.g.dart';

@freezed
abstract class WordResponse with _$WordResponse {
  const factory WordResponse({
    String? word,
    List<Phonetics>? phonetics,
    List<Meanings>? meanings,
    License? license,
    List<String>? sourceUrls,
  }) = _WordResponse;

  factory WordResponse.fromJson(Map<String, dynamic> json) =>
      _$WordResponseFromJson(json);
}
