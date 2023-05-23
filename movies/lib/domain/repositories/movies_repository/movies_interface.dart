import 'package:movies/data/models/genre_response/genre_response.dart';
import 'package:movies/data/models/movie/movie_model.dart';

abstract class MoviesInterface {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getMovieByGenre(int movieId);
   Future<List<Genre>> getGenreList();
   Future<List<MovieModel>> searchMovies(String query);
   Future<List<MovieModel>> getReviews(String movieId);
}
