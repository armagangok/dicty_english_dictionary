import '../../../../../../global/export/export.dart';

part 'definitions.freezed.dart';
part 'definitions.g.dart';

@freezed
abstract class Definitions with _$Definitions {
  const factory Definitions({
    required String? definition,
    required List? synonyms,
    required List? antonyms,
    required String? example,
  }) = _Definitions;

  factory Definitions.fromJson(Map<String, dynamic> json) =>
      _$DefinitionsFromJson(json);
}
