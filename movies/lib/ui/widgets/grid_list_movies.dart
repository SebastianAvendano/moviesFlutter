import 'package:flutter/material.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/ui/widgets/card_movie.dart';

class GridListMovies extends StatelessWidget {
  const GridListMovies({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<MovieModel> movies;
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: List.generate(
        movies.length,
        (index) {
          MovieModel movie = movies[index];
          return CardMovie(movie: movie);
        },
      ),
    );
  }
}
