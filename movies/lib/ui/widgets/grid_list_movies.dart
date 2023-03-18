
import 'package:flutter/material.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/ui/widgets/card_movie.dart';

class GridListMovies extends StatelessWidget {
  const GridListMovies({
    Key? key,
    required this.movies, required this.size,
  }) : super(key: key);

  final List<MovieModel> movies;
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: Expanded(
        child: GridView(
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
        ),
      ),
    );
  }
}