import 'package:countdown_app/countdown/domain/entity/countdown.dart';
import 'package:countdown_app/store/domain/entity/category.dart';
import 'package:countdown_app/store/domain/entity/filter_countdowns_by_category.dart';
import 'package:countdown_app/store/infra/datasource/i_store_datasource.dart';

class StoreRepository {
  final IStoreDatasource _datasource;
  StoreRepository(IStoreDatasource datasource) : _datasource = datasource;

  Future<List<Category>> getCategories() => _datasource.getCategories();

  Future<List<Countdown>> getCountdownsByCategory(
          FilterCountdownsByCategory filterCountdownsByCategory) =>
      _datasource.getCountdownsByCategory(filterCountdownsByCategory);
}
