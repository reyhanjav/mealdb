import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mealdb/features/meals/domain/entity/ingredient/ingredient.dart';

part 'ingredient_dto.freezed.dart';

@freezed
class IngredientDto with _$IngredientDto {
  const IngredientDto._();

  const factory IngredientDto({String? ingredient, String? measure}) =
      _IngredientDto;

  factory IngredientDto.fromDomain(Ingredient? value) {
    return IngredientDto(
        ingredient: value?.ingredient, measure: value?.measure);
  }

  Ingredient toDomain() {
    return Ingredient(ingredient: ingredient, measure: measure);
  }
}
