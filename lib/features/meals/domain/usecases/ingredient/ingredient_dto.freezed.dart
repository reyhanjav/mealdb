// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingredient_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IngredientDtoTearOff {
  const _$IngredientDtoTearOff();

  _IngredientDto call({String? ingredient, String? measure}) {
    return _IngredientDto(
      ingredient: ingredient,
      measure: measure,
    );
  }
}

/// @nodoc
const $IngredientDto = _$IngredientDtoTearOff();

/// @nodoc
mixin _$IngredientDto {
  String? get ingredient => throw _privateConstructorUsedError;
  String? get measure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IngredientDtoCopyWith<IngredientDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientDtoCopyWith<$Res> {
  factory $IngredientDtoCopyWith(
          IngredientDto value, $Res Function(IngredientDto) then) =
      _$IngredientDtoCopyWithImpl<$Res>;
  $Res call({String? ingredient, String? measure});
}

/// @nodoc
class _$IngredientDtoCopyWithImpl<$Res>
    implements $IngredientDtoCopyWith<$Res> {
  _$IngredientDtoCopyWithImpl(this._value, this._then);

  final IngredientDto _value;
  // ignore: unused_field
  final $Res Function(IngredientDto) _then;

  @override
  $Res call({
    Object? ingredient = freezed,
    Object? measure = freezed,
  }) {
    return _then(_value.copyWith(
      ingredient: ingredient == freezed
          ? _value.ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as String?,
      measure: measure == freezed
          ? _value.measure
          : measure // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$IngredientDtoCopyWith<$Res>
    implements $IngredientDtoCopyWith<$Res> {
  factory _$IngredientDtoCopyWith(
          _IngredientDto value, $Res Function(_IngredientDto) then) =
      __$IngredientDtoCopyWithImpl<$Res>;
  @override
  $Res call({String? ingredient, String? measure});
}

/// @nodoc
class __$IngredientDtoCopyWithImpl<$Res>
    extends _$IngredientDtoCopyWithImpl<$Res>
    implements _$IngredientDtoCopyWith<$Res> {
  __$IngredientDtoCopyWithImpl(
      _IngredientDto _value, $Res Function(_IngredientDto) _then)
      : super(_value, (v) => _then(v as _IngredientDto));

  @override
  _IngredientDto get _value => super._value as _IngredientDto;

  @override
  $Res call({
    Object? ingredient = freezed,
    Object? measure = freezed,
  }) {
    return _then(_IngredientDto(
      ingredient: ingredient == freezed
          ? _value.ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as String?,
      measure: measure == freezed
          ? _value.measure
          : measure // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_IngredientDto extends _IngredientDto {
  const _$_IngredientDto({this.ingredient, this.measure}) : super._();

  @override
  final String? ingredient;
  @override
  final String? measure;

  @override
  String toString() {
    return 'IngredientDto(ingredient: $ingredient, measure: $measure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IngredientDto &&
            const DeepCollectionEquality()
                .equals(other.ingredient, ingredient) &&
            const DeepCollectionEquality().equals(other.measure, measure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ingredient),
      const DeepCollectionEquality().hash(measure));

  @JsonKey(ignore: true)
  @override
  _$IngredientDtoCopyWith<_IngredientDto> get copyWith =>
      __$IngredientDtoCopyWithImpl<_IngredientDto>(this, _$identity);
}

abstract class _IngredientDto extends IngredientDto {
  const factory _IngredientDto({String? ingredient, String? measure}) =
      _$_IngredientDto;
  const _IngredientDto._() : super._();

  @override
  String? get ingredient;
  @override
  String? get measure;
  @override
  @JsonKey(ignore: true)
  _$IngredientDtoCopyWith<_IngredientDto> get copyWith =>
      throw _privateConstructorUsedError;
}
