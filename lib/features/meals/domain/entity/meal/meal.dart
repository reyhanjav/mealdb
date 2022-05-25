import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mealdb/features/meals/domain/entity/ingredient/ingredient.dart';

part 'meal.freezed.dart';

@freezed
class Meal with _$Meal {
  factory Meal(
      {String? id,
      String? title,
      String? thumbnail,
      String? category,
      String? area,
      String? instructions,
      String? tags,
      String? youtubeLink,
      @Default([]) List<Ingredient?> ingredients}) = _Meal;
}
