import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mealdb/features/meals/domain/entity/category/category.dart';

part 'category_dto.freezed.dart';

@freezed
class CategoryDto with _$CategoryDto {
  const CategoryDto._();

  const factory CategoryDto({String? category}) = _CategoryDto;

  factory CategoryDto.fromDomain(Category? value) {
    return CategoryDto(category: value?.category);
  }

  Category toDomain() {
    return Category(category: category);
  }

  factory CategoryDto.fromJson(Map<String, dynamic>? json) {
    return CategoryDto(
      category: json?['strCategory'] as String?,
    );
  }

  static List<Category> fromJsonList(List<Object?> list) {
    List<Category> result = List<Category>.empty(growable: true);
    if (list.isNotEmpty) {
      for (var object in list) {
        result.add(
            CategoryDto.fromJson(object as Map<String, dynamic>?).toDomain());
      }
    }

    return result;
  }

  static List<Map<String, dynamic>> toJsonList(List<Category> list) {
    List<Map<String, dynamic>> result =
        List<Map<String, dynamic>>.empty(growable: true);
    for (Category object in list) {
      result.add(CategoryDto.fromDomain(object).toJson());
    }

    return result;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{'strCategory': category};
}
