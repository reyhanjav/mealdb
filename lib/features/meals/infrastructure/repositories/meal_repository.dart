import 'package:mealdb/core/api_client/api_client.dart';
import 'package:mealdb/core/injection/injection.dart';
import 'package:mealdb/features/meals/domain/entity/category/category.dart';
import 'package:mealdb/features/meals/domain/entity/meal/meal.dart';
import 'package:mealdb/features/meals/domain/usecases/category/category_dto.dart';
import 'package:mealdb/features/meals/domain/usecases/meal/meal_dto.dart';
import 'package:mealdb/features/meals/infrastructure/interfaces/meal_interface.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IMealRepository)
class MealRepository implements IMealRepository {
  ApiClient? api = getIt<ApiClient>();
  static const PREFIX = '/movie/';

  @override
  Future<List<Category>> listCategories() async {
    List<Category> results = List<Category>.empty(growable: true);
    var response = await api?.get('/list.php?c=list', queryParameters: {});
    var body = response?.data['meals'];
    List<Category> datas = CategoryDto.fromJsonList(body ?? []);
    results = datas;
    return results;
  }

  @override
  Future<List<Meal>> listMeals(String category) async {
    List<Meal> results = List<Meal>.empty(growable: true);
    var response = await api?.get('/filter.php?c=$category');

    var body = response?.data['meals'];
    List<Meal> datas = MealDto.fromJsonList(body ?? []);
    results = datas;
    return results;
  }

  @override
  Future<Meal> getMealDetails(String id) async {
    var response = await api?.get('/lookup.php?i=$id');
    var body = response?.data['meals'][0];
    Meal datas = MealDto.fromJson(body).toDomain();
    return datas;
  }
}
