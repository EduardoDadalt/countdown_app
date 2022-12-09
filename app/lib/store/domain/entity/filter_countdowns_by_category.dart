import 'package:countdown_app/store/domain/entity/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_countdowns_by_category.freezed.dart';

@unfreezed
class FilterCountdownsByCategory with _$FilterCountdownsByCategory {
  factory FilterCountdownsByCategory({
    required Category category,
    @Default(1) int page,
    @Default(24) int size,
  }) = _FilterCountdownsByCategory;
}
