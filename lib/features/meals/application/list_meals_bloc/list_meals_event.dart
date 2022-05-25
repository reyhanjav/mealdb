part of 'list_meals_bloc.dart';

@freezed
class ListMealsEvent with _$ListMealsEvent {
  const factory ListMealsEvent.list(String category) = _ListMeals;
}
