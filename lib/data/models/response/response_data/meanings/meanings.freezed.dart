// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meanings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Meaning _$MeaningFromJson(Map<String, dynamic> json) {
  return _Meaning.fromJson(json);
}

/// @nodoc
mixin _$Meaning {
  String? get partOfSpeech => throw _privateConstructorUsedError;
  List<Definitions>? get definitions => throw _privateConstructorUsedError;
  List<dynamic>? get synonyms => throw _privateConstructorUsedError;
  List<dynamic>? get antonyms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeaningCopyWith<Meaning> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeaningCopyWith<$Res> {
  factory $MeaningCopyWith(Meaning value, $Res Function(Meaning) then) =
      _$MeaningCopyWithImpl<$Res, Meaning>;
  @useResult
  $Res call(
      {String? partOfSpeech,
      List<Definitions>? definitions,
      List<dynamic>? synonyms,
      List<dynamic>? antonyms});
}

/// @nodoc
class _$MeaningCopyWithImpl<$Res, $Val extends Meaning>
    implements $MeaningCopyWith<$Res> {
  _$MeaningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partOfSpeech = freezed,
    Object? definitions = freezed,
    Object? synonyms = freezed,
    Object? antonyms = freezed,
  }) {
    return _then(_value.copyWith(
      partOfSpeech: freezed == partOfSpeech
          ? _value.partOfSpeech
          : partOfSpeech // ignore: cast_nullable_to_non_nullable
              as String?,
      definitions: freezed == definitions
          ? _value.definitions
          : definitions // ignore: cast_nullable_to_non_nullable
              as List<Definitions>?,
      synonyms: freezed == synonyms
          ? _value.synonyms
          : synonyms // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      antonyms: freezed == antonyms
          ? _value.antonyms
          : antonyms // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MeaningCopyWith<$Res> implements $MeaningCopyWith<$Res> {
  factory _$$_MeaningCopyWith(
          _$_Meaning value, $Res Function(_$_Meaning) then) =
      __$$_MeaningCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? partOfSpeech,
      List<Definitions>? definitions,
      List<dynamic>? synonyms,
      List<dynamic>? antonyms});
}

/// @nodoc
class __$$_MeaningCopyWithImpl<$Res>
    extends _$MeaningCopyWithImpl<$Res, _$_Meaning>
    implements _$$_MeaningCopyWith<$Res> {
  __$$_MeaningCopyWithImpl(_$_Meaning _value, $Res Function(_$_Meaning) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partOfSpeech = freezed,
    Object? definitions = freezed,
    Object? synonyms = freezed,
    Object? antonyms = freezed,
  }) {
    return _then(_$_Meaning(
      partOfSpeech: freezed == partOfSpeech
          ? _value.partOfSpeech
          : partOfSpeech // ignore: cast_nullable_to_non_nullable
              as String?,
      definitions: freezed == definitions
          ? _value._definitions
          : definitions // ignore: cast_nullable_to_non_nullable
              as List<Definitions>?,
      synonyms: freezed == synonyms
          ? _value._synonyms
          : synonyms // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      antonyms: freezed == antonyms
          ? _value._antonyms
          : antonyms // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Meaning implements _Meaning {
  const _$_Meaning(
      {required this.partOfSpeech,
      required final List<Definitions>? definitions,
      required final List<dynamic>? synonyms,
      required final List<dynamic>? antonyms})
      : _definitions = definitions,
        _synonyms = synonyms,
        _antonyms = antonyms;

  factory _$_Meaning.fromJson(Map<String, dynamic> json) =>
      _$$_MeaningFromJson(json);

  @override
  final String? partOfSpeech;
  final List<Definitions>? _definitions;
  @override
  List<Definitions>? get definitions {
    final value = _definitions;
    if (value == null) return null;
    if (_definitions is EqualUnmodifiableListView) return _definitions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _synonyms;
  @override
  List<dynamic>? get synonyms {
    final value = _synonyms;
    if (value == null) return null;
    if (_synonyms is EqualUnmodifiableListView) return _synonyms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _antonyms;
  @override
  List<dynamic>? get antonyms {
    final value = _antonyms;
    if (value == null) return null;
    if (_antonyms is EqualUnmodifiableListView) return _antonyms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Meaning(partOfSpeech: $partOfSpeech, definitions: $definitions, synonyms: $synonyms, antonyms: $antonyms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Meaning &&
            (identical(other.partOfSpeech, partOfSpeech) ||
                other.partOfSpeech == partOfSpeech) &&
            const DeepCollectionEquality()
                .equals(other._definitions, _definitions) &&
            const DeepCollectionEquality().equals(other._synonyms, _synonyms) &&
            const DeepCollectionEquality().equals(other._antonyms, _antonyms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      partOfSpeech,
      const DeepCollectionEquality().hash(_definitions),
      const DeepCollectionEquality().hash(_synonyms),
      const DeepCollectionEquality().hash(_antonyms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeaningCopyWith<_$_Meaning> get copyWith =>
      __$$_MeaningCopyWithImpl<_$_Meaning>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeaningToJson(
      this,
    );
  }
}

abstract class _Meaning implements Meaning {
  const factory _Meaning(
      {required final String? partOfSpeech,
      required final List<Definitions>? definitions,
      required final List<dynamic>? synonyms,
      required final List<dynamic>? antonyms}) = _$_Meaning;

  factory _Meaning.fromJson(Map<String, dynamic> json) = _$_Meaning.fromJson;

  @override
  String? get partOfSpeech;
  @override
  List<Definitions>? get definitions;
  @override
  List<dynamic>? get synonyms;
  @override
  List<dynamic>? get antonyms;
  @override
  @JsonKey(ignore: true)
  _$$_MeaningCopyWith<_$_Meaning> get copyWith =>
      throw _privateConstructorUsedError;
}
