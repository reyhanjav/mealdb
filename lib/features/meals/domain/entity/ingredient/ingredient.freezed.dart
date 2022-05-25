// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IngredientTearOff {
  const _$IngredientTearOff();

  _Ingredient call({String? ingredient, String? measure}) {
    return _Ingredient(
      ingredient: ingredient,
      measure: measure,
    );
  }
}

/// @nodoc
const $Ingredient = _$IngredientTearOff();

/// @nodoc
mixin _$Ingredient {
  String? get ingredient => throw _privateConstructorUsedError;
  String? get measure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IngredientCopyWith<Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
          Ingredient value, $Res Function(Ingredient) then) =
      _$IngredientCopyWithImpl<$Res>;
  $Res call({String? ingredient, String? measure});
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res> implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  final Ingredient _value;
  // ignore: unused_field
  final $Res Function(Ingredient) _then;

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
abstract class _$IngredientCopyWith<$Res> implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(
          _Ingredient value, $Res Function(_Ingredient) then) =
      __$IngredientCopyWithImpl<$Res>;
  @override
  $Res call({String? ingredient, String? measure});
}

/// @nodoc
class __$IngredientCopyWithImpl<$Res> extends _$IngredientCopyWithImpl<$Res>
    implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(
      _Ingredient _value, $Res Function(_Ingredient) _then)
      : super(_value, (v) => _then(v as _Ingredient));

  @override
  _Ingredient get _value => super._value as _Ingredient;

  @override
  $Res call({
    Object? ingredient = freezed,
    Object? measure = freezed,
  }) {
    return _then(_Ingredient(
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

class _$_Ingredient implements _Ingredient {
  _$_Ingredient({this.ingredient, this.measure});

  @override
  final String? ingredient;
  @override
  final String? measure;

  @override
  String toString() {
    return 'Ingredient(ingredient: $ingredient, measure: $measure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Ingredient &&
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
  _$IngredientCopyWith<_Ingredient> get copyWith =>
      __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);
}

abstract class _Ingredient implements Ingredient {
  factory _Ingredient({String? ingredient, String? measure}) = _$_Ingredient;

  @override
  String? get ingredient;
  @override
  String? get measure;
  @override
  @JsonKey(ignore: true)
  _$IngredientCopyWith<_Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}
