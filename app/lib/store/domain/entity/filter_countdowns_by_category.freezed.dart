// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filter_countdowns_by_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterCountdownsByCategory {
  Category get category => throw _privateConstructorUsedError;
  set category(Category value) => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  set page(int value) => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  set size(int value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterCountdownsByCategoryCopyWith<FilterCountdownsByCategory>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCountdownsByCategoryCopyWith<$Res> {
  factory $FilterCountdownsByCategoryCopyWith(FilterCountdownsByCategory value,
          $Res Function(FilterCountdownsByCategory) then) =
      _$FilterCountdownsByCategoryCopyWithImpl<$Res,
          FilterCountdownsByCategory>;
  @useResult
  $Res call({Category category, int page, int size});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$FilterCountdownsByCategoryCopyWithImpl<$Res,
        $Val extends FilterCountdownsByCategory>
    implements $FilterCountdownsByCategoryCopyWith<$Res> {
  _$FilterCountdownsByCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FilterCountdownsByCategoryCopyWith<$Res>
    implements $FilterCountdownsByCategoryCopyWith<$Res> {
  factory _$$_FilterCountdownsByCategoryCopyWith(
          _$_FilterCountdownsByCategory value,
          $Res Function(_$_FilterCountdownsByCategory) then) =
      __$$_FilterCountdownsByCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Category category, int page, int size});

  @override
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$_FilterCountdownsByCategoryCopyWithImpl<$Res>
    extends _$FilterCountdownsByCategoryCopyWithImpl<$Res,
        _$_FilterCountdownsByCategory>
    implements _$$_FilterCountdownsByCategoryCopyWith<$Res> {
  __$$_FilterCountdownsByCategoryCopyWithImpl(
      _$_FilterCountdownsByCategory _value,
      $Res Function(_$_FilterCountdownsByCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(_$_FilterCountdownsByCategory(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FilterCountdownsByCategory implements _FilterCountdownsByCategory {
  _$_FilterCountdownsByCategory(
      {required this.category, this.page = 1, this.size = 24});

  @override
  Category category;
  @override
  @JsonKey()
  int page;
  @override
  @JsonKey()
  int size;

  @override
  String toString() {
    return 'FilterCountdownsByCategory(category: $category, page: $page, size: $size)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterCountdownsByCategoryCopyWith<_$_FilterCountdownsByCategory>
      get copyWith => __$$_FilterCountdownsByCategoryCopyWithImpl<
          _$_FilterCountdownsByCategory>(this, _$identity);
}

abstract class _FilterCountdownsByCategory
    implements FilterCountdownsByCategory {
  factory _FilterCountdownsByCategory(
      {required Category category,
      int page,
      int size}) = _$_FilterCountdownsByCategory;

  @override
  Category get category;
  set category(Category value);
  @override
  int get page;
  set page(int value);
  @override
  int get size;
  set size(int value);
  @override
  @JsonKey(ignore: true)
  _$$_FilterCountdownsByCategoryCopyWith<_$_FilterCountdownsByCategory>
      get copyWith => throw _privateConstructorUsedError;
}
