import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

@freezed
class Ingredient with _$Ingredient {
  factory Ingredient({String? ingredient, String? measure}) = _Ingredient;
}
