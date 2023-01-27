import '../../../../../../global/export/export.dart';

part 'word_request.freezed.dart';
part 'word_request.g.dart';

@freezed
abstract class WordRequest with _$WordRequest {
  const factory WordRequest({
    required String wordText,
  }) = _WordRequest;

  factory WordRequest.fromJson(Map<String, dynamic> json) =>
      _$WordRequestFromJson(json);
}
