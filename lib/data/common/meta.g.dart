// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta(
    json['current_page'] as int,
    json['from'] as int,
    json['per_page'] as int,
    json['last_page'] as int,
    json['to'] as int,
    json['total'] as int,
    json['path'] as String,
  );
}

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'per_page': instance.perPage,
      'last_page': instance.lastPage,
      'to': instance.to,
      'total': instance.total,
      'path': instance.path,
    };
