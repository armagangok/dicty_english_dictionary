// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordRequest _$WordRequestFromJson(Map<String, dynamic> json) {
  return _WordRequest.fromJson(json);
}

/// @nodoc
mixin _$WordRequest {
  String get wordText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordRequestCopyWith<WordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordRequestCopyWith<$Res> {
  factory $WordRequestCopyWith(
          WordRequest value, $Res Function(WordRequest) then) =
      _$WordRequestCopyWithImpl<$Res, WordRequest>;
  @useResult
  $Res call({String wordText});
}

/// @nodoc
class _$WordRequestCopyWithImpl<$Res, $Val extends WordRequest>
    implements $WordRequestCopyWith<$Res> {
  _$WordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordText = null,
  }) {
    return _then(_value.copyWith(
      wordText: null == wordText
          ? _value.wordText
          : wordText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WordRequestCopyWith<$Res>
    implements $WordRequestCopyWith<$Res> {
  factory _$$_WordRequestCopyWith(
          _$_WordRequest value, $Res Function(_$_WordRequest) then) =
      __$$_WordRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String wordText});
}

/// @nodoc
class __$$_WordRequestCopyWithImpl<$Res>
    extends _$WordRequestCopyWithImpl<$Res, _$_WordRequest>
    implements _$$_WordRequestCopyWith<$Res> {
  __$$_WordRequestCopyWithImpl(
      _$_WordRequest _value, $Res Function(_$_WordRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordText = null,
  }) {
    return _then(_$_WordRequest(
      wordText: null == wordText
          ? _value.wordText
          : wordText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WordRequest implements _WordRequest {
  const _$_WordRequest({required this.wordText});

  factory _$_WordRequest.fromJson(Map<String, dynamic> json) =>
      _$$_WordRequestFromJson(json);

  @override
  final String wordText;

  @override
  String toString() {
    return 'WordRequest(wordText: $wordText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordRequest &&
            (identical(other.wordText, wordText) ||
                other.wordText == wordText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, wordText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordRequestCopyWith<_$_WordRequest> get copyWith =>
      __$$_WordRequestCopyWithImpl<_$_WordRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordRequestToJson(
      this,
    );
  }
}

abstract class _WordRequest implements WordRequest {
  const factory _WordRequest({required final String wordText}) = _$_WordRequest;

  factory _WordRequest.fromJson(Map<String, dynamic> json) =
      _$_WordRequest.fromJson;

  @override
  String get wordText;
  @override
  @JsonKey(ignore: true)
  _$$_WordRequestCopyWith<_$_WordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
