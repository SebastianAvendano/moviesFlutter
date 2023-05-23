import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/domain/blocs/movie/movie_bloc.dart';
import 'package:movies/ui/widgets/activity_indicator.dart';

class MoviePoster extends StatelessWidget {
  final MovieModel movie;
  const MoviePoster(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<MovieBloc>().add(MovieEventSetMovieSelected(movie));
        Navigator.pushNamed(context, '/details');
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: CachedNetworkImage(
          imageUrl: "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
          width: MediaQuery.of(context).size.width,
          placeholder: (context, url) => const ActivityIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
