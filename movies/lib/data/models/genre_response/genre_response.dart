// To parse this JSON data, do
//
//     final genreResponse = genreResponseFromJson(jsonString);

import 'dart:convert';

class GenreResponse {
    GenreResponse({
        this.genres,
    });

    final List<Genre>? genres;

    GenreResponse copyWith({
        List<Genre>? genres,
    }) => 
        GenreResponse(
            genres: genres ?? this.genres,
        );

    factory GenreResponse.fromRawJson(String str) => GenreResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GenreResponse.fromJson(Map<String, dynamic> json) => GenreResponse(
        genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
    };
}

class Genre {
    Genre({
        this.id,
        this.name,
    });

    final int? id;
    final String? name;

    Genre copyWith({
        int? id,
        String? name,
    }) => 
        Genre(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory Genre.fromRawJson(String str) => Genre.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
