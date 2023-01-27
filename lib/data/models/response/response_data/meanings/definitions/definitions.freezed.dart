// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'definitions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Definitions _$DefinitionsFromJson(Map<String, dynamic> json) {
  return _Definitions.fromJson(json);
}

/// @nodoc
mixin _$Definitions {
  String? get definition => throw _privateConstructorUsedError;
  List<dynamic>? get synonyms => throw _privateConstructorUsedError;
  List<dynamic>? get antonyms => throw _privateConstructorUsedError;
  String? get example => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefinitionsCopyWith<Definitions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefinitionsCopyWith<$Res> {
  factory $DefinitionsCopyWith(
          Definitions value, $Res Function(Definitions) then) =
      _$DefinitionsCopyWithImpl<$Res, Definitions>;
  @useResult
  $Res call(
      {String? definition,
      List<dynamic>? synonyms,
      List<dynamic>? antonyms,
      String? example});
}

/// @nodoc
class _$DefinitionsCopyWithImpl<$Res, $Val extends Definitions>
    implements $DefinitionsCopyWith<$Res> {
  _$DefinitionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = freezed,
    Object? synonyms = freezed,
    Object? antonyms = freezed,
    Object? example = freezed,
  }) {
    return _then(_value.copyWith(
      definition: freezed == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String?,
      synonyms: freezed == synonyms
          ? _value.synonyms
          : synonyms // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      antonyms: freezed == antonyms
          ? _value.antonyms
          : antonyms // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      example: freezed == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DefinitionsCopyWith<$Res>
    implements $DefinitionsCopyWith<$Res> {
  factory _$$_DefinitionsCopyWith(
          _$_Definitions value, $Res Function(_$_Definitions) then) =
      __$$_DefinitionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? definition,
      List<dynamic>? synonyms,
      List<dynamic>? antonyms,
      String? example});
}

/// @nodoc
class __$$_DefinitionsCopyWithImpl<$Res>
    extends _$DefinitionsCopyWithImpl<$Res, _$_Definitions>
    implements _$$_DefinitionsCopyWith<$Res> {
  __$$_DefinitionsCopyWithImpl(
      _$_Definitions _value, $Res Function(_$_Definitions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = freezed,
    Object? synonyms = freezed,
    Object? antonyms = freezed,
    Object? example = freezed,
  }) {
    return _then(_$_Definitions(
      definition: freezed == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String?,
      synonyms: freezed == synonyms
          ? _value._synonyms
          : synonyms // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      antonyms: freezed == antonyms
          ? _value._antonyms
          : antonyms // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      example: freezed == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Definitions implements _Definitions {
  const _$_Definitions(
      {required this.definition,
      required final List<dynamic>? synonyms,
      required final List<dynamic>? antonyms,
      required this.example})
      : _synonyms = synonyms,
        _antonyms = antonyms;

  factory _$_Definitions.fromJson(Map<String, dynamic> json) =>
      _$$_DefinitionsFromJson(json);

  @override
  final String? definition;
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
  final String? example;

  @override
  String toString() {
    return 'Definitions(definition: $definition, synonyms: $synonyms, antonyms: $antonyms, example: $example)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Definitions &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            const DeepCollectionEquality().equals(other._synonyms, _synonyms) &&
            const DeepCollectionEquality().equals(other._antonyms, _antonyms) &&
            (identical(other.example, example) || other.example == example));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      definition,
      const DeepCollectionEquality().hash(_synonyms),
      const DeepCollectionEquality().hash(_antonyms),
      example);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DefinitionsCopyWith<_$_Definitions> get copyWith =>
      __$$_DefinitionsCopyWithImpl<_$_Definitions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DefinitionsToJson(
      this,
    );
  }
}

abstract class _Definitions implements Definitions {
  const factory _Definitions(
      {required final String? definition,
      required final List<dynamic>? synonyms,
      required final List<dynamic>? antonyms,
      required final String? example}) = _$_Definitions;

  factory _Definitions.fromJson(Map<String, dynamic> json) =
      _$_Definitions.fromJson;

  @override
  String? get definition;
  @override
  List<dynamic>? get synonyms;
  @override
  List<dynamic>? get antonyms;
  @override
  String? get example;
  @override
  @JsonKey(ignore: true)
  _$$_DefinitionsCopyWith<_$_Definitions> get copyWith =>
      throw _privateConstructorUsedError;
}
