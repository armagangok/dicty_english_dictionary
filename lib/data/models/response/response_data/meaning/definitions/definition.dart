import '../../../../../../global/export/export.dart';

part 'definition.freezed.dart';
part 'definition.g.dart';

@freezed
abstract class Definition with _$Definition {
  const factory Definition({
    required String? definition,
    required List? synonyms,
    required List? antonyms,
    required String? example,
  }) = _Definition;

  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);
}
