// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'asset_model.g.dart';

@JsonSerializable()
class AssetModel {
  final String? gatewayId;
  final String? id;
  final String? locationId;
  final String? name;
  final String? parentId;
  final String? sensorId;
  final String? sensorType;
  final String? status;

  AssetModel(
      {required this.gatewayId,
      required this.id,
      required this.locationId,
      required this.name,
      required this.parentId,
      required this.sensorId,
      required this.sensorType,
      required this.status});

  factory AssetModel.fromJson(Map<String, dynamic> json) => _$AssetModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetModelToJson(this);

  static List<AssetModel> fromJsonArray(List<dynamic> data) => data.map((item) => AssetModel.fromJson(item)).toList();
}
