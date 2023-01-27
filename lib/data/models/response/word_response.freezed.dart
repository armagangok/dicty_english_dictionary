// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordResponse _$WordResponseFromJson(Map<String, dynamic> json) {
  return _WordResponse.fromJson(json);
}

/// @nodoc
mixin _$WordResponse {
  String? get word => throw _privateConstructorUsedError;
  List<Phonetics>? get phonetics => throw _privateConstructorUsedError;
  List<Meaning>? get meanings => throw _privateConstructorUsedError;
  License? get license => throw _privateConstructorUsedError;
  List<String>? get sourceUrls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordResponseCopyWith<WordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordResponseCopyWith<$Res> {
  factory $WordResponseCopyWith(
          WordResponse value, $Res Function(WordResponse) then) =
      _$WordResponseCopyWithImpl<$Res, WordResponse>;
  @useResult
  $Res call(
      {String? word,
      List<Phonetics>? phonetics,
      List<Meaning>? meanings,
      License? license,
      List<String>? sourceUrls});

  $LicenseCopyWith<$Res>? get license;
}

/// @nodoc
class _$WordResponseCopyWithImpl<$Res, $Val extends WordResponse>
    implements $WordResponseCopyWith<$Res> {
  _$WordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = freezed,
    Object? phonetics = freezed,
    Object? meanings = freezed,
    Object? license = freezed,
    Object? sourceUrls = freezed,
  }) {
    return _then(_value.copyWith(
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      phonetics: freezed == phonetics
          ? _value.phonetics
          : phonetics // ignore: cast_nullable_to_non_nullable
              as List<Phonetics>?,
      meanings: freezed == meanings
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<Meaning>?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as License?,
      sourceUrls: freezed == sourceUrls
          ? _value.sourceUrls
          : sourceUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LicenseCopyWith<$Res>? get license {
    if (_value.license == null) {
      return null;
    }

    return $LicenseCopyWith<$Res>(_value.license!, (value) {
      return _then(_value.copyWith(license: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WordResponseCopyWith<$Res>
    implements $WordResponseCopyWith<$Res> {
  factory _$$_WordResponseCopyWith(
          _$_WordResponse value, $Res Function(_$_WordResponse) then) =
      __$$_WordResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? word,
      List<Phonetics>? phonetics,
      List<Meaning>? meanings,
      License? license,
      List<String>? sourceUrls});

  @override
  $LicenseCopyWith<$Res>? get license;
}

/// @nodoc
class __$$_WordResponseCopyWithImpl<$Res>
    extends _$WordResponseCopyWithImpl<$Res, _$_WordResponse>
    implements _$$_WordResponseCopyWith<$Res> {
  __$$_WordResponseCopyWithImpl(
      _$_WordResponse _value, $Res Function(_$_WordResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = freezed,
    Object? phonetics = freezed,
    Object? meanings = freezed,
    Object? license = freezed,
    Object? sourceUrls = freezed,
  }) {
    return _then(_$_WordResponse(
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      phonetics: freezed == phonetics
          ? _value._phonetics
          : phonetics // ignore: cast_nullable_to_non_nullable
              as List<Phonetics>?,
      meanings: freezed == meanings
          ? _value._meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<Meaning>?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as License?,
      sourceUrls: freezed == sourceUrls
          ? _value._sourceUrls
          : sourceUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WordResponse implements _WordResponse {
  const _$_WordResponse(
      {required this.word,
      required final List<Phonetics>? phonetics,
      required final List<Meaning>? meanings,
      required this.license,
      required final List<String>? sourceUrls})
      : _phonetics = phonetics,
        _meanings = meanings,
        _sourceUrls = sourceUrls;

  factory _$_WordResponse.fromJson(Map<String, dynamic> json) =>
      _$$_WordResponseFromJson(json);

  @override
  final String? word;
  final List<Phonetics>? _phonetics;
  @override
  List<Phonetics>? get phonetics {
    final value = _phonetics;
    if (value == null) return null;
    if (_phonetics is EqualUnmodifiableListView) return _phonetics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Meaning>? _meanings;
  @override
  List<Meaning>? get meanings {
    final value = _meanings;
    if (value == null) return null;
    if (_meanings is EqualUnmodifiableListView) return _meanings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final License? license;
  final List<String>? _sourceUrls;
  @override
  List<String>? get sourceUrls {
    final value = _sourceUrls;
    if (value == null) return null;
    if (_sourceUrls is EqualUnmodifiableListView) return _sourceUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WordResponse(word: $word, phonetics: $phonetics, meanings: $meanings, license: $license, sourceUrls: $sourceUrls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordResponse &&
            (identical(other.word, word) || other.word == word) &&
            const DeepCollectionEquality()
                .equals(other._phonetics, _phonetics) &&
            const DeepCollectionEquality().equals(other._meanings, _meanings) &&
            (identical(other.license, license) || other.license == license) &&
            const DeepCollectionEquality()
                .equals(other._sourceUrls, _sourceUrls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      word,
      const DeepCollectionEquality().hash(_phonetics),
      const DeepCollectionEquality().hash(_meanings),
      license,
      const DeepCollectionEquality().hash(_sourceUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordResponseCopyWith<_$_WordResponse> get copyWith =>
      __$$_WordResponseCopyWithImpl<_$_WordResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordResponseToJson(
      this,
    );
  }
}

abstract class _WordResponse implements WordResponse {
  const factory _WordResponse(
      {required final String? word,
      required final List<Phonetics>? phonetics,
      required final List<Meaning>? meanings,
      required final License? license,
      required final List<String>? sourceUrls}) = _$_WordResponse;

  factory _WordResponse.fromJson(Map<String, dynamic> json) =
      _$_WordResponse.fromJson;

  @override
  String? get word;
  @override
  List<Phonetics>? get phonetics;
  @override
  List<Meaning>? get meanings;
  @override
  License? get license;
  @override
  List<String>? get sourceUrls;
  @override
  @JsonKey(ignore: true)
  _$$_WordResponseCopyWith<_$_WordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
