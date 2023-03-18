import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/genre_response/genre_response.dart';
import 'package:movies/data/models/movie_response/movie_response.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/domain/repositories/movies_interface.dart';

const String baseUrl = 'https://api.themoviedb.org/3';
const String apiKey = 'fb2683306562c11cd4066cfb35a00c8c';
  final params = {"api_key": apiKey, "language": "es-ES", "page": 1};

@injectable
class MoviesImpl implements MoviesInterface {
  
  final Dio _dio;
  
  MoviesImpl(this._dio);


  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    try {
      const url = '$baseUrl/movie/now_playing?$apiKey';
      Response response = await _dio.get(url, queryParameters: params);

      final moviesResponse = MovieResponse.fromJson(response.data);
      return moviesResponse.results!;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  @override
  Future<List<MovieModel>> getMovieByGenre(int movieId) async {
    try {
      final url = '$baseUrl/discover/movie?with_genres=$movieId&$apiKey';
      Response response = await _dio.get(url, queryParameters: params);
      final moviesResponse = MovieResponse.fromJson(response.data);
      return moviesResponse.results!;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  @override
  Future<List<Genre>> getGenreList() async {
    try {
      const url = '$baseUrl/genre/movie/list?$apiKey';
      Response response = await _dio.get(url, queryParameters: params);
      final genreResponse = GenreResponse.fromJson(response.data);
      return genreResponse.genres!;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    try {
      final paramsSearch = {
        "api_key": apiKey,
        "language": "es-ES",
        "query": query,
        "page": 1
      };
      const url = '$baseUrl/search/movie?$apiKey';
      Response response = await _dio.get(url, queryParameters: paramsSearch);
      final moviesResponse = MovieResponse.fromJson(response.data);
      return moviesResponse.results!;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  @override
  Future<List<MovieModel>> getReviews(String movieId) async {
    try {
      final url = '$baseUrl/movie/$movieId/reviews?$apiKey';
      Response response = await _dio.get(url, queryParameters: params);
      final moviesResponse = MovieResponse.fromJson(response.data);
      return moviesResponse.results!;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
