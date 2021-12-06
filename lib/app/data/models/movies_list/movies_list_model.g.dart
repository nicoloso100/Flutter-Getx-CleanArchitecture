// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesListModel _$MoviesListModelFromJson(Map<String, dynamic> json) =>
    MoviesListModel(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieCoverModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total_pages: json['total_pages'] as int,
      total_results: json['total_results'] as int,
    );

Map<String, dynamic> _$MoviesListModelToJson(MoviesListModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };
