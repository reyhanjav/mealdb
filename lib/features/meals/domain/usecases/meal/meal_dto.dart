import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mealdb/features/meals/domain/entity/ingredient/ingredient.dart';
import 'package:mealdb/features/meals/domain/entity/meal/meal.dart';
import 'package:mealdb/features/meals/domain/usecases/ingredient/ingredient_dto.dart';

part 'meal_dto.freezed.dart';

@freezed
class MealDto with _$MealDto {
  const MealDto._();

  const factory MealDto(
      {String? id,
      String? title,
      String? thumbnail,
      String? category,
      String? area,
      String? instructions,
      String? tags,
      String? youtubeLink,
      @Default([]) List<IngredientDto> ingredients}) = _MealDto;

  factory MealDto.fromDomain(Meal? meal) {
    return MealDto(
        id: meal?.id,
        title: meal?.title,
        thumbnail: meal?.thumbnail,
        category: meal?.category,
        area: meal?.area,
        instructions: meal?.instructions,
        tags: meal?.tags,
        youtubeLink: meal?.youtubeLink,
        ingredients: List<IngredientDto>.from(meal?.ingredients
                .map((ingredient) => (ingredient != null)
                    ? IngredientDto.fromDomain(ingredient)
                    : null)
                .toList() ??
            []));
  }

  Meal toDomain() {
    return Meal(
        id: id,
        title: title,
        thumbnail: thumbnail,
        category: category,
        area: area,
        instructions: instructions,
        tags: tags,
        youtubeLink: youtubeLink,
        ingredients: List<Ingredient?>.from(
            ingredients.map((ingredient) => ingredient.toDomain()).toList()));
  }

  factory MealDto.fromJson(Map<String, dynamic>? json) {
    List<IngredientDto> ingredients = List<IngredientDto>.empty(growable: true);
    for (var i = 1; i <= 20; i++) {
      String? ingredient = json?['strIngredient$i'] as String?;
      String? measure = json?['strMeasure$i'] as String?;

      if ((ingredient != null && ingredient != '') &&
          (measure != null && measure != '')) {
        ingredients
            .add(IngredientDto(ingredient: ingredient, measure: measure));
      }
    }
    return MealDto(
      id: json?['idMeal'] as String?,
      title: json?['strMeal'] as String?,
      category: json?['strCategory'] as String?,
      area: json?['strArea'] as String?,
      instructions: json?['strInstructions'] as String?,
      tags: json?['strTags'] as String?,
      thumbnail: json?['strMealThumb'] as String?,
      youtubeLink: json?['strYoutube'] as String?,
      ingredients: ingredients,
    );
  }

  static List<Meal> fromJsonList(List<Object?> list) {
    List<Meal> result = List<Meal>.empty(growable: true);
    if (list.isNotEmpty) {
      for (var object in list) {
        result
            .add(MealDto.fromJson(object as Map<String, dynamic>?).toDomain());
      }
    }

    return result;
  }

  static List<Map<String, dynamic>> toJsonList(List<Meal> list) {
    List<Map<String, dynamic>> result =
        List<Map<String, dynamic>>.empty(growable: true);
    for (Meal object in list) {
      result.add(MealDto.fromDomain(object).toJson());
    }

    return result;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'idMeal': id,
        'strMeal': title,
        'strMealThumb': thumbnail,
      };
}
