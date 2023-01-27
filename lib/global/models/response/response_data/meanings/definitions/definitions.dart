import '../../../../../export/export.dart';

part 'definitions.freezed.dart';
part 'definitions.g.dart';

@freezed
abstract class Definitions with _$Definitions {
  const factory Definitions({
    String? definition,
    List? synonyms,
    List? antonyms,
    String? example,
  }) = _Definitions;

  factory Definitions.fromJson(Map<String, dynamic> json) =>
      _$DefinitionsFromJson(json);
}
