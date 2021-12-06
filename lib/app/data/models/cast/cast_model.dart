import 'package:flutter_movies/app/data/models/actor/actor_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cast_model.g.dart';

@JsonSerializable()
class CastModel {
  final int id;
  final List<ActorModel> cast;

  CastModel({required this.id, required this.cast});

  factory CastModel.fromJson(Map<String, dynamic> json) =>
      _$CastModelFromJson(json);

  Map<String, dynamic> toJson() => _$CastModelToJson(this);
}
