// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Countdown _$$_CountdownFromJson(Map<String, dynamic> json) => _$_Countdown(
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_CountdownToJson(_$_Countdown instance) =>
    <String, dynamic>{
      'title': instance.title,
      'date': instance.date.toIso8601String(),
    };
