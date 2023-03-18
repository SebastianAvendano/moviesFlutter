// To parse this JSON data, do
//
//     final MovieResponse = MovieResponseFromJson(jsonString);
// ignore_for_file: depend_on_referenced_packages, unnecessary_null_in_if_null_operators

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movies/domain/entities/dates/dates_model.dart';
import 'package:movies/data/models/movie/movie_model.dart';

@JsonSerializable()
class MovieResponse {
  const MovieResponse({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  final Dates? dates;
  final int? page;
  final List<MovieModel>? results;
  final int? totalPages;
  final int? totalResults;

  MovieResponse copyWith({
    Dates? dates,
    int? page,
    List<MovieModel>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      MovieResponse(
        dates: dates ?? this.dates,
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory MovieResponse.fromRawJson(String str) =>
      MovieResponse.fromJson(json.decode(str));

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      MovieResponse(
        dates: json["dates"] == null ? null : Dates.fromJson(json["dates"]),
        page: json["page"] ?? null,
        results: json["results"] == null
            ? null
            : List<MovieModel>.from(json["results"].map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"] ?? null,
        totalResults:
            json["total_results"] ?? null,
      );
}
