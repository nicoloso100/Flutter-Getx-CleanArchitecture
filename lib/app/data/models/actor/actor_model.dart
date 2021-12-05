import 'package:json_annotation/json_annotation.dart';

part 'actor_model.g.dart';

@JsonSerializable()
class ActorModel {
  final bool adult;
  final int gender;
  final int id;
  final String known_for_department;
  final String name;
  final String original_name;
  final double popularity;
  final String profile_path;
  final int cast_id;
  final String character;
  final String credit_id;
  final int order;

  ActorModel(
      {required this.adult,
      required this.gender,
      required this.id,
      required this.known_for_department,
      required this.name,
      required this.original_name,
      required this.popularity,
      required this.profile_path,
      required this.cast_id,
      required this.character,
      required this.credit_id,
      required this.order});

  factory ActorModel.fromJson(Map<String, dynamic> json) =>
      _$ActorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActorModelToJson(this);
}
