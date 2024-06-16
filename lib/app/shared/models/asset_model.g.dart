// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetModel _$AssetModelFromJson(Map<String, dynamic> json) => AssetModel(
      gatewayId: json['gatewayId'] as String?,
      id: json['id'] as String?,
      locationId: json['locationId'] as String?,
      name: json['name'] as String?,
      parentId: json['parentId'] as String?,
      sensorId: json['sensorId'] as String?,
      sensorType: json['sensorType'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AssetModelToJson(AssetModel instance) =>
    <String, dynamic>{
      'gatewayId': instance.gatewayId,
      'id': instance.id,
      'locationId': instance.locationId,
      'name': instance.name,
      'parentId': instance.parentId,
      'sensorId': instance.sensorId,
      'sensorType': instance.sensorType,
      'status': instance.status,
    };
