import 'package:mealdb/features/meals/domain/entity/category/category.dart';
import 'package:mealdb/features/meals/domain/entity/meal/meal.dart';

abstract class IMealRepository {
  Future<List<Meal>> listMeals(String category);
  Future<Meal> getMealDetails(String id);
  Future<List<Category>> listCategories();
}
