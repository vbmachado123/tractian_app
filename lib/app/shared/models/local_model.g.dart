// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalModel _$LocalModelFromJson(Map<String, dynamic> json) => LocalModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      parentId: json['parentId'] as String?,
    );

Map<String, dynamic> _$LocalModelToJson(LocalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
    };
