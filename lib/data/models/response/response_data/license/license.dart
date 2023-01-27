import '../../../../../global/export/export.dart';

part 'license.freezed.dart';
part 'license.g.dart';

@freezed
abstract class License with _$License {
  const factory License({
    String? name,
    String? url,
  }) = _License;

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);
}
