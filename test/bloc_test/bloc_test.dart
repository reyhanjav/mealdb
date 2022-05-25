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

class MockRepository extends Mock implements IMealRepository {}

void unawaited(Future<void>? _) {}
@GenerateMocks([MockRepository])
void main() {
  group('blocTest', () {
    late IMealRepository _iMealRepository;
    setUpAll(() async {
      app.main();
      _iMealRepository = MockRepository();
    });
    group('CategoryBloc', () {
      setUp(() {
        _iMealRepository = MockRepository();
        when(_iMealRepository.listCategories())
            .thenAnswer((_) async => [Category(category: 'Beef')]);
      });

      blocTest<CategoryBloc, CategoryState>(
        'emits when nothing is added',
        act: (bloc) => bloc.add(const CategoryEvent.list()),
        build: () {
          return CategoryBloc(_iMealRepository);
        },
        expect: () => [isA<CategoryState>(), isA<CategoryState>()],
      );
    });
    group('ListMealsBloc', () {
      blocTest<ListMealsBloc, ListMealsState>(
        'emits when nothing is added',
        build: () => ListMealsBloc(_iMealRepository),
        act: (bloc) => bloc.add(const ListMealsEvent.list('')),
        expect: () => [isA<ListMealsState>(), isA<ListMealsState>()],
      );
      blocTest<ListMealsBloc, ListMealsState>(
        'emits when category is added',
        build: () => ListMealsBloc(_iMealRepository),
        act: (bloc) => bloc.add(const ListMealsEvent.list('Beef')),
        expect: () => [isA<ListMealsState>(), isA<ListMealsState>()],
      );
    });
    group('MealDetailsBloc', () {
      blocTest<MealDetailsBloc, MealDetailsState>(
        'emits when nothing is added',
        build: () => MealDetailsBloc(_iMealRepository),
        act: (bloc) => bloc.add(const MealDetailsEvent.details('')),
        expect: () => [isA<MealDetailsState>(), isA<MealDetailsState>()],
      );
    });
  });
}
