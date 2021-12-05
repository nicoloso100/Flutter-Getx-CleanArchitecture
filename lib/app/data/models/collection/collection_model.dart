import 'package:json_annotation/json_annotation.dart';

part 'collection_model.g.dart';

@JsonSerializable()
class CollectionModel {
  final int id;
  final String name;
  final String poster_path;
  final String backdrop_path;

  CollectionModel(
      {required this.id,
      required this.name,
      required this.poster_path,
      required this.backdrop_path});

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionModelToJson(this);
}
