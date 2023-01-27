// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phonetics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Phonetics _$PhoneticsFromJson(Map<String, dynamic> json) {
  return _Phonetics.fromJson(json);
}

/// @nodoc
mixin _$Phonetics {
  String? get audio => throw _privateConstructorUsedError;
  String? get sourceUrl => throw _privateConstructorUsedError;
  License? get license => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneticsCopyWith<Phonetics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneticsCopyWith<$Res> {
  factory $PhoneticsCopyWith(Phonetics value, $Res Function(Phonetics) then) =
      _$PhoneticsCopyWithImpl<$Res, Phonetics>;
  @useResult
  $Res call({String? audio, String? sourceUrl, License? license, String? text});

  $LicenseCopyWith<$Res>? get license;
}

/// @nodoc
class _$PhoneticsCopyWithImpl<$Res, $Val extends Phonetics>
    implements $PhoneticsCopyWith<$Res> {
  _$PhoneticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audio = freezed,
    Object? sourceUrl = freezed,
    Object? license = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as License?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_PhoneticsCopyWith<$Res> implements $PhoneticsCopyWith<$Res> {
  factory _$$_PhoneticsCopyWith(
          _$_Phonetics value, $Res Function(_$_Phonetics) then) =
      __$$_PhoneticsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? audio, String? sourceUrl, License? license, String? text});

  @override
  $LicenseCopyWith<$Res>? get license;
}

/// @nodoc
class __$$_PhoneticsCopyWithImpl<$Res>
    extends _$PhoneticsCopyWithImpl<$Res, _$_Phonetics>
    implements _$$_PhoneticsCopyWith<$Res> {
  __$$_PhoneticsCopyWithImpl(
      _$_Phonetics _value, $Res Function(_$_Phonetics) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audio = freezed,
    Object? sourceUrl = freezed,
    Object? license = freezed,
    Object? text = freezed,
  }) {
    return _then(_$_Phonetics(
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as License?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Phonetics implements _Phonetics {
  const _$_Phonetics({this.audio, this.sourceUrl, this.license, this.text});

  factory _$_Phonetics.fromJson(Map<String, dynamic> json) =>
      _$$_PhoneticsFromJson(json);

  @override
  final String? audio;
  @override
  final String? sourceUrl;
  @override
  final License? license;
  @override
  final String? text;

  @override
  String toString() {
    return 'Phonetics(audio: $audio, sourceUrl: $sourceUrl, license: $license, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Phonetics &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, audio, sourceUrl, license, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhoneticsCopyWith<_$_Phonetics> get copyWith =>
      __$$_PhoneticsCopyWithImpl<_$_Phonetics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhoneticsToJson(
      this,
    );
  }
}

abstract class _Phonetics implements Phonetics {
  const factory _Phonetics(
      {final String? audio,
      final String? sourceUrl,
      final License? license,
      final String? text}) = _$_Phonetics;

  factory _Phonetics.fromJson(Map<String, dynamic> json) =
      _$_Phonetics.fromJson;

  @override
  String? get audio;
  @override
  String? get sourceUrl;
  @override
  License? get license;
  @override
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$_PhoneticsCopyWith<_$_Phonetics> get copyWith =>
      throw _privateConstructorUsedError;
}
