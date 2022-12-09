// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'countdown.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Countdown _$CountdownFromJson(Map<String, dynamic> json) {
  return _Countdown.fromJson(json);
}

/// @nodoc
mixin _$Countdown {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountdownCopyWith<Countdown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountdownCopyWith<$Res> {
  factory $CountdownCopyWith(Countdown value, $Res Function(Countdown) then) =
      _$CountdownCopyWithImpl<$Res, Countdown>;
  @useResult
  $Res call({String? id, String title, DateTime date});
}

/// @nodoc
class _$CountdownCopyWithImpl<$Res, $Val extends Countdown>
    implements $CountdownCopyWith<$Res> {
  _$CountdownCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountdownCopyWith<$Res> implements $CountdownCopyWith<$Res> {
  factory _$$_CountdownCopyWith(
          _$_Countdown value, $Res Function(_$_Countdown) then) =
      __$$_CountdownCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String title, DateTime date});
}

/// @nodoc
class __$$_CountdownCopyWithImpl<$Res>
    extends _$CountdownCopyWithImpl<$Res, _$_Countdown>
    implements _$$_CountdownCopyWith<$Res> {
  __$$_CountdownCopyWithImpl(
      _$_Countdown _value, $Res Function(_$_Countdown) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? date = null,
  }) {
    return _then(_$_Countdown(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Countdown extends _Countdown {
  const _$_Countdown({this.id, required this.title, required this.date})
      : super._();

  factory _$_Countdown.fromJson(Map<String, dynamic> json) =>
      _$$_CountdownFromJson(json);

  @override
  final String? id;
  @override
  final String title;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'Countdown(id: $id, title: $title, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Countdown &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountdownCopyWith<_$_Countdown> get copyWith =>
      __$$_CountdownCopyWithImpl<_$_Countdown>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountdownToJson(
      this,
    );
  }
}

abstract class _Countdown extends Countdown {
  const factory _Countdown(
      {final String? id,
      required final String title,
      required final DateTime date}) = _$_Countdown;
  const _Countdown._() : super._();

  factory _Countdown.fromJson(Map<String, dynamic> json) =
      _$_Countdown.fromJson;

  @override
  String? get id;
  @override
  String get title;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_CountdownCopyWith<_$_Countdown> get copyWith =>
      throw _privateConstructorUsedError;
}
