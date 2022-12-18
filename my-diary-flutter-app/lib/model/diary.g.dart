// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diary _$DiaryFromJson(Map<String, dynamic> json) => Diary(
      json['id'] as String,
      json['title'] as String,
      json['des'] as String,
      json['favorite'] as bool,
      (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$DiaryToJson(Diary instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'des': instance.des,
      'favorite': instance.favorite,
      'image': instance.image,
      'date': instance.date.toIso8601String(),
    };
