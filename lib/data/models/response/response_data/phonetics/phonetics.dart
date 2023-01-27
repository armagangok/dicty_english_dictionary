import '../../../../../global/export/export.dart';
import '../license/license.dart';

part 'phonetics.freezed.dart';
part 'phonetics.g.dart';

@freezed
abstract class Phonetics with _$Phonetics {
  const factory Phonetics({
    required String? audio,
    required String? sourceUrl,
    required License? license,
    required String? text,
  }) = _Phonetics;

  factory Phonetics.fromJson(Map<String, dynamic> json) =>
      _$PhoneticsFromJson(json);
}
