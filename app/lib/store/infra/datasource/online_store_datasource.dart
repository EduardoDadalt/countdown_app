import 'dart:convert';

import 'package:countdown_app/api/api.dart';
import 'package:countdown_app/countdown/domain/entity/countdown.dart';
import 'package:countdown_app/store/domain/entity/category.dart';
import 'package:countdown_app/store/domain/entity/filter_countdowns_by_category.dart';
import 'package:countdown_app/store/infra/datasource/i_store_datasource.dart';

class OnlineStoreDatasource extends IStoreDatasource {
  final API _api;
  OnlineStoreDatasource(API api) : _api = api;

  @override
  Future<List<Category>> getCategories() async {
    final response = await _api.get('/category');
    final json = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    final categories = json
        .map(
          (categoryJson) => Category.fromJson(categoryJson),
        )
        .toList();
    return categories;
  }

  @override
  Future<List<Countdown>> getCountdownsByCategory(
    FilterCountdownsByCategory filterCountdownsByCategory,
  ) async {
    final response = await _api.get(
      '/category/${filterCountdownsByCategory.category.id}/countdowns',
      queryParameters: {
        'p': filterCountdownsByCategory.page,
        'size': filterCountdownsByCategory.size,
      },
    );
    final json = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    final countdowns = json
        .map(
          (categoryJson) => Countdown.fromJson(categoryJson),
        )
        .toList();
    return countdowns;
  }
}
