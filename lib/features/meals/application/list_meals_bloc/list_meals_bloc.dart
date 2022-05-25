import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mealdb/features/meals/domain/entity/meal/meal.dart';
import 'package:mealdb/features/meals/infrastructure/interfaces/meal_interface.dart';
import 'package:injectable/injectable.dart';
part 'list_meals_event.dart';
part 'list_meals_state.dart';
part 'list_meals_bloc.freezed.dart';

@injectable
class ListMealsBloc extends Bloc<ListMealsEvent, ListMealsState> {
  final IMealRepository? _iMealRepository;

  ListMealsBloc(this._iMealRepository)
      : super(const ListMealsState.loadInProgress()) {
    on<ListMealsEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(
      ListMealsEvent event, Emitter<ListMealsState> emit) async {
    await event.map(list: (value) async {
      try {
        emit(const ListMealsState.loadInProgress());
        final data = await _iMealRepository?.listMeals(value.category);

        emit(ListMealsState.loadSuccess(data ?? []));
      } catch (e) {
        emit(const ListMealsState.loadFailure());
      }
    });
  }
}
