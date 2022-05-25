part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.loadInProgress() = _LoadInProgress;
  const factory CategoryState.loadSuccess(List<Category> result) = _LoadSuccess;
  const factory CategoryState.loadFailure() = _LoadFailure;
}
