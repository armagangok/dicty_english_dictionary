import '../../../../../global/export/export.dart';

import 'definitions/definition.dart';

part 'meaning.freezed.dart';
part 'meaning.g.dart';

@freezed
abstract class Meaning with _$Meaning {
  const factory Meaning({
    required String? partOfSpeech,
    required List<Definition>? definitions,
    required List? synonyms,
    required List? antonyms,
  }) = _Meaning;

  factory Meaning.fromJson(Map<String, dynamic> json) =>
      _$MeaningFromJson(json);
}
