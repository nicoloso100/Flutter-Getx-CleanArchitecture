import 'package:json_annotation/json_annotation.dart';

part 'actor_model.g.dart';

@JsonSerializable()
class ActorModel {
  final bool? adult;
  final int? gender;
  final int id;
  final String? known_for_department;
  final String? name;
  final String? original_name;
  final double? popularity;
  final String? profile_path;
  final int? cast_id;
  final String? character;
  final String? credit_id;
  final int? order;

  ActorModel(
      {this.adult,
      this.gender,
      required this.id,
      this.known_for_department,
      this.name,
      this.original_name,
      this.popularity,
      this.profile_path,
      this.cast_id,
      this.character,
      this.credit_id,
      this.order});

  factory ActorModel.fromJson(Map<String, dynamic> json) =>
      _$ActorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActorModelToJson(this);
}
