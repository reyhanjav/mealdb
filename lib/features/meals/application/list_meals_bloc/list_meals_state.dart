part of 'list_meals_bloc.dart';

@freezed
class ListMealsState with _$ListMealsState {
  const factory ListMealsState.loadInProgress() = _LoadInProgress;
  const factory ListMealsState.loadSuccess(List<Meal> result) = _LoadSuccess;
  const factory ListMealsState.loadFailure() = _LoadFailure;
}
