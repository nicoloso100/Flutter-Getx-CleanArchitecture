import 'package:json_annotation/json_annotation.dart';

part 'production_country_model.g.dart';

@JsonSerializable()
class ProductionCountryModel {
  final String? iso_3166_1;
  final String? name;

  ProductionCountryModel({this.iso_3166_1, this.name});

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryModelToJson(this);
}
