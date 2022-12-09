import 'package:countdown_app/countdown/domain/entity/countdown.dart';
import 'package:countdown_app/store/domain/entity/category.dart';
import 'package:countdown_app/store/domain/entity/filter_countdowns_by_category.dart';

abstract class IStoreDatasource {
  Future<List<Category>> getCategories();
  Future<List<Countdown>> getCountdownsByCategory(
    FilterCountdownsByCategory filterCountdownsByCategory,
  );
}
