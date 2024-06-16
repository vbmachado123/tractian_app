// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  final String? id;
  final String? name;

  CompanyModel({required this.id, required this.name});

  factory CompanyModel.fromJson(Map<String, dynamic> json) => _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);

  static List<CompanyModel> fromJsonArray(List<dynamic> data) =>
      data.map((item) => CompanyModel.fromJson(item)).toList();
}
