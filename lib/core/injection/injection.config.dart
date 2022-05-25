// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/meals/application/category_bloc/category_bloc.dart'
    as _i4;
import '../../features/meals/application/list_meals_bloc/list_meals_bloc.dart'
    as _i7;
import '../../features/meals/application/meal_details_bloc/meal_details_bloc.dart'
    as _i8;
import '../../features/meals/infrastructure/interfaces/meal_interface.dart'
    as _i5;
import '../../features/meals/infrastructure/repositories/meal_repository.dart'
    as _i6;
import '../api_client/api_client.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ApiClient>(() => _i3.ApiClient());
  gh.factory<_i4.CategoryBloc>(
      () => _i4.CategoryBloc(get<_i5.IMealRepository>()));
  gh.lazySingleton<_i5.IMealRepository>(() => _i6.MealRepository());
  gh.factory<_i7.ListMealsBloc>(
      () => _i7.ListMealsBloc(get<_i5.IMealRepository>()));
  gh.factory<_i8.MealDetailsBloc>(
      () => _i8.MealDetailsBloc(get<_i5.IMealRepository>()));
  return get;
}
