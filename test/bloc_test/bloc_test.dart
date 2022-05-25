import 'package:flutter_test/flutter_test.dart';
import 'package:mealdb/features/meals/application/category_bloc/category_bloc.dart';
import 'package:mealdb/features/meals/application/list_meals_bloc/list_meals_bloc.dart';
import 'package:mealdb/features/meals/application/meal_details_bloc/meal_details_bloc.dart';
import 'package:mealdb/features/meals/domain/entity/category/category.dart';
import 'package:mealdb/features/meals/domain/entity/meal/meal.dart';

import 'package:mealdb/features/meals/infrastructure/interfaces/meal_interface.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mealdb/main.dart' as app;

import 'bloc_test.mocks.dart';

class MealRepository extends Mock implements IMealRepository {}

@GenerateMocks([MealRepository])
void main() {
  group('blocTest', () {
    late MockMealRepository _iMealRepository;
    setUpAll(() async {
      app.main();
      _iMealRepository = MockMealRepository();
      when(_iMealRepository.listCategories())
          .thenAnswer((_) async => [Category(category: 'Beef')]);
      when(_iMealRepository.listMeals('')).thenAnswer((_) async => []);
      when(_iMealRepository.listMeals('Beef'))
          .thenAnswer((_) async => [Meal(title: 'Title')]);
      when(_iMealRepository.getMealDetails('52772'))
          .thenAnswer((_) async => Meal(title: 'Title'));
    });
    group('CategoryBloc', () {
      blocTest<CategoryBloc, CategoryState>(
        'emits when nothing is added',
        act: (bloc) => bloc.add(const CategoryEvent.list()),
        build: () {
          return CategoryBloc(_iMealRepository);
        },
        expect: () => [
          isA<CategoryState>(),
          CategoryState.loadSuccess([Category(category: 'Beef')])
        ],
      );
    });
    group('ListMealsBloc', () {
      blocTest<ListMealsBloc, ListMealsState>(
        'emits when nothing is added',
        build: () {
          return ListMealsBloc(_iMealRepository);
        },
        act: (bloc) => bloc.add(const ListMealsEvent.list('')),
        expect: () => [isA<ListMealsState>(), ListMealsState.loadSuccess([])],
      );
      blocTest<ListMealsBloc, ListMealsState>(
        'emits when category is added',
        build: () {
          return ListMealsBloc(_iMealRepository);
        },
        act: (bloc) => bloc.add(const ListMealsEvent.list('Beef')),
        expect: () => [
          isA<ListMealsState>(),
          ListMealsState.loadSuccess([Meal(title: 'Title')])
        ],
      );
    });
    group('MealDetailsBloc', () {
      blocTest<MealDetailsBloc, MealDetailsState>(
        'emits when id is added',
        build: () {
          return MealDetailsBloc(_iMealRepository);
        },
        act: (bloc) => bloc.add(const MealDetailsEvent.details('52772')),
        expect: () => [
          isA<MealDetailsState>(),
          MealDetailsState.loadSuccess(Meal(title: 'Title'))
        ],
      );
    });
  });
}
