import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mealdb/features/meals/domain/entity/category/category.dart';
import 'package:mealdb/features/meals/infrastructure/interfaces/meal_interface.dart';
import 'package:injectable/injectable.dart';
part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final IMealRepository? _iMealRepository;

  CategoryBloc(this._iMealRepository)
      : super(const CategoryState.loadInProgress()) {
    on<CategoryEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(
      CategoryEvent event, Emitter<CategoryState> emit) async {
    await event.map(list: (value) async {
      try {
        emit(const CategoryState.loadInProgress());
        final data = await _iMealRepository?.listCategories();

        emit(CategoryState.loadSuccess(data ?? []));
      } catch (e) {
        emit(const CategoryState.loadFailure());
      }
    });
  }
}
