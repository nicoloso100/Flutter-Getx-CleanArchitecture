import 'package:json_annotation/json_annotation.dart';

part 'production_company_model.g.dart';

@JsonSerializable()
class ProductionCompanyModel {
  final int id;
  final String name;
  final String logo_path;
  final String origin_country;

  ProductionCompanyModel(
      {required this.id,
      required this.name,
      required this.logo_path,
      required this.origin_country});

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyModelToJson(this);
}
