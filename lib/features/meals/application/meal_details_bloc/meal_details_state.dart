part of 'meal_details_bloc.dart';

@freezed
class MealDetailsState with _$MealDetailsState {
  const factory MealDetailsState.loadInProgress() = _LoadInProgress;
  const factory MealDetailsState.loadSuccess(Meal? result) = _LoadSuccess;
  const factory MealDetailsState.loadFailure() = _LoadFailure;
}
