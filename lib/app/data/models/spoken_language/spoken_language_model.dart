import 'package:json_annotation/json_annotation.dart';

part 'spoken_language_model.g.dart';

@JsonSerializable()
class SpokenLanguageModel {
  final String english_name;
  final String iso_639_1;
  final String name;

  SpokenLanguageModel(
      {required this.english_name,
      required this.iso_639_1,
      required this.name});

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageModelToJson(this);
}
