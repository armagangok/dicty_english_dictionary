import '../../../../export/export.dart';
import 'definitions/definitions.dart';

part 'meanings.freezed.dart';
part 'meanings.g.dart';

@freezed
abstract class Meanings with _$Meanings {
  const factory Meanings({
    String? partOfSpeech,
    List<Definitions>? definitions,
    List? synonyms,
    List? antonyms,
  }) = _Meanings;

  factory Meanings.fromJson(Map<String, dynamic> json) =>
      _$MeaningsFromJson(json);
}
