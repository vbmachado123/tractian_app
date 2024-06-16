// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'package:mobx/mobx.dart';
import 'package:tractian_app/app/shared/models/asset_model.dart';
import 'package:tractian_app/app/shared/models/local_model.dart';
part 'tree_node_model.g.dart';

@JsonSerializable()
class TreeNode {
  final String id;
  final String? locationId;
  final String name;
  final String? parentId;
  final String? sensorType;
  final String? status;
  final String? sensorId;
  final List<TreeNode> children;
  bool isFirst = false;
  bool isExpanded = true;

  TreeNode({
    required this.id,
    this.locationId,
    required this.name,
    this.parentId,
    this.sensorType,
    this.status,
    this.sensorId,
    this.children = const [],
    this.isExpanded = true,
  });

  factory TreeNode.fromAsset(AssetModel asset) {
    return TreeNode(
      id: asset.id!,
      locationId: asset.locationId,
      name: asset.name!,
      parentId: asset.parentId,
      sensorType: asset.sensorType,
      status: asset.status,
      sensorId: asset.sensorId,
      children: [],
    );
  }

  factory TreeNode.fromLocal(LocalModel local) {
    return TreeNode(
      id: local.id!,
      name: local.name!,
      parentId: local.parentId,
      children: [],
    );
  }

  TreeNode copyWith({
    String? id,
    String? locationId,
    String? name,
    String? parentId,
    String? sensorType,
    String? status,
    String? sensorId,
    List<TreeNode>? children,
  }) {
    return TreeNode(
      id: id ?? this.id,
      locationId: locationId ?? this.locationId,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      sensorType: sensorType ?? this.sensorType,
      status: status ?? this.status,
      sensorId: sensorId ?? this.sensorId,
      children: children ?? this.children,
    );
  }

  factory TreeNode.fromJson(Map<String, dynamic> json) => _$TreeNodeFromJson(json);

  Map<String, dynamic> toJson() => _$TreeNodeToJson(this);

  static List<TreeNode> fromJsonArray(List<dynamic> data) => data.map((item) => TreeNode.fromJson(item)).toList();
}
