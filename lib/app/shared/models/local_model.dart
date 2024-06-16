// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'local_model.g.dart';

@JsonSerializable()
class LocalModel {
  final String? id;
  final String? name;
  final String? parentId;

  LocalModel({required this.id, required this.name, required this.parentId});

  factory LocalModel.fromJson(Map<String, dynamic> json) => _$LocalModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocalModelToJson(this);

  static List<LocalModel> fromJsonArray(List<dynamic> data) => data.map((item) => LocalModel.fromJson(item)).toList();
}
