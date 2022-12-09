import 'package:countdown_app/countdown/domain/entity/countdown.dart';
import 'package:countdown_app/store/domain/entity/category.dart';
import 'package:countdown_app/store/domain/entity/filter_countdowns_by_category.dart';
import 'package:countdown_app/store/infra/store_repository.dart';
import 'package:flutter/material.dart';

class StoreController extends ChangeNotifier {
  final StoreRepository _repository;
  StoreController(StoreRepository repository) : _repository = repository;

  Category? _selectedCategory;
  Category? get selectedCategory => _selectedCategory;
  set selectedCategory(Category? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Future<List<Category>> getCategories() => _repository.getCategories();

  Future<List<Countdown>> getCountdownByCategory({
    required int page,
    required int size,
  }) async {
    if (_selectedCategory == null) {
      return [];
    }
    final filterCountdownsByCategory = FilterCountdownsByCategory(
      category: _selectedCategory!,
      page: page,
      size: size,
    );
    return _repository.getCountdownsByCategory(filterCountdownsByCategory);
  }
}
