import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mealdb/features/meals/domain/entity/meal/meal.dart';
import 'package:mealdb/features/meals/infrastructure/interfaces/meal_interface.dart';
import 'package:injectable/injectable.dart';
part 'meal_details_event.dart';
part 'meal_details_state.dart';
part 'meal_details_bloc.freezed.dart';

@injectable
class MealDetailsBloc extends Bloc<MealDetailsEvent, MealDetailsState> {
  final IMealRepository? _iMealRepository;

  MealDetailsBloc(this._iMealRepository)
      : super(const MealDetailsState.loadInProgress()) {
    on<MealDetailsEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(
      MealDetailsEvent event, Emitter<MealDetailsState> emit) async {
    await event.map(details: (value) async {
      try {
        emit(const MealDetailsState.loadInProgress());
        final data = await _iMealRepository?.getMealDetails(value.id);

        emit(MealDetailsState.loadSuccess(data));
      } catch (e) {
        emit(const MealDetailsState.loadFailure());
      }
    });
  }
}
