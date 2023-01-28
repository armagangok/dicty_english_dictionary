// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Definition _$DefinitionFromJson(Map<String, dynamic> json) {
  return _Definition.fromJson(json);
}

/// @nodoc
mixin _$Definition {
  String? get definition => throw _privateConstructorUsedError;
  List<dynamic>? get synonyms => throw _privateConstructorUsedError;
  List<dynamic>? get antonyms => throw _privateConstructorUsedError;
  String? get example => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefinitionCopyWith<Definition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefinitionCopyWith<$Res> {
  factory $DefinitionCopyWith(
          Definition value, $Res Function(Definition) then) =
      _$DefinitionCopyWithImpl<$Res, Definition>;
  @useResult
  $Res call(
      {String? definition,
      List<dynamic>? synonyms,
      List<dynamic>? antonyms,
      String? example});
}

/// @nodoc
class _$DefinitionCopyWithImpl<$Res, $Val extends Definition>
    implements $DefinitionCopyWith<$Res> {
  _$DefinitionCopyWithImpl(this._value, this._then);

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
abstract class _$$_DefinitionCopyWith<$Res>
    implements $DefinitionCopyWith<$Res> {
  factory _$$_DefinitionCopyWith(
          _$_Definition value, $Res Function(_$_Definition) then) =
      __$$_DefinitionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? definition,
      List<dynamic>? synonyms,
      List<dynamic>? antonyms,
      String? example});
}

/// @nodoc
class __$$_DefinitionCopyWithImpl<$Res>
    extends _$DefinitionCopyWithImpl<$Res, _$_Definition>
    implements _$$_DefinitionCopyWith<$Res> {
  __$$_DefinitionCopyWithImpl(
      _$_Definition _value, $Res Function(_$_Definition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = freezed,
    Object? synonyms = freezed,
    Object? antonyms = freezed,
    Object? example = freezed,
  }) {
    return _then(_$_Definition(
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
class _$_Definition implements _Definition {
  const _$_Definition(
      {required this.definition,
      required final List<dynamic>? synonyms,
      required final List<dynamic>? antonyms,
      required this.example})
      : _synonyms = synonyms,
        _antonyms = antonyms;

  factory _$_Definition.fromJson(Map<String, dynamic> json) =>
      _$$_DefinitionFromJson(json);

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
    return 'Definition(definition: $definition, synonyms: $synonyms, antonyms: $antonyms, example: $example)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Definition &&
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
  _$$_DefinitionCopyWith<_$_Definition> get copyWith =>
      __$$_DefinitionCopyWithImpl<_$_Definition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DefinitionToJson(
      this,
    );
  }
}

abstract class _Definition implements Definition {
  const factory _Definition(
      {required final String? definition,
      required final List<dynamic>? synonyms,
      required final List<dynamic>? antonyms,
      required final String? example}) = _$_Definition;

  factory _Definition.fromJson(Map<String, dynamic> json) =
      _$_Definition.fromJson;

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
  _$$_DefinitionCopyWith<_$_Definition> get copyWith =>
      throw _privateConstructorUsedError;
}
