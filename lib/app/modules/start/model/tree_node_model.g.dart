// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_node_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreeNode _$TreeNodeFromJson(Map<String, dynamic> json) => TreeNode(
      id: json['id'] as String,
      locationId: json['locationId'] as String?,
      name: json['name'] as String,
      parentId: json['parentId'] as String?,
      sensorType: json['sensorType'] as String?,
      status: json['status'] as String?,
      sensorId: json['sensorId'] as String?,
      children: (json['children'] as List<dynamic>?)
              ?.map((e) => TreeNode.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isExpanded: json['isExpanded'] as bool? ?? true,
    )..isFirst = json['isFirst'] as bool;

Map<String, dynamic> _$TreeNodeToJson(TreeNode instance) => <String, dynamic>{
      'id': instance.id,
      'locationId': instance.locationId,
      'name': instance.name,
      'parentId': instance.parentId,
      'sensorType': instance.sensorType,
      'status': instance.status,
      'sensorId': instance.sensorId,
      'children': instance.children,
      'isFirst': instance.isFirst,
      'isExpanded': instance.isExpanded,
    };
