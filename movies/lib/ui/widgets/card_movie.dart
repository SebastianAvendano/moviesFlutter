import 'package:cached_network_image/cached_network_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/domain/blocs/movie/movie_bloc.dart';
import 'package:movies/ui/views/home_view/home_controller.dart';
import 'package:movies/ui/widgets/activity_indicator.dart';

final injector = GetIt.instance;
final controller = injector.get<HomeController>();

class CardMovie extends StatelessWidget {
  const CardMovie({
    super.key,
    required this.movie,
    this.isFavorite = false,
  });

  final MovieModel movie;
  final bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: _renderCard(context),
    );
  }

  Widget _renderCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageBuilder: (context, imageProvider) {
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<MovieBloc>()
                          .add(MovieEventSetMovieSelected(movie));
                      Navigator.pushNamed(context, '/details');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
                placeholder: (context, url) => const ActivityIndicator(),
              ),
            ),
            FavoriteButton(
              isFavorite: isFavorite,
              valueChanged: (value) {
                if (value) {
                  controller.setFavoritre(context, movie);
                } else {
                  controller.removeFavoritre(context, movie);
                }
              },
              iconColor: Colors.red,
              iconSize: 30,
            ),
          ],
        ),
        Text(
          movie.title ?? 'No title',
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _renderStars(),
            Text(
              movie.voteAverage.toString(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _renderStars() {
    return Flexible(
      child: RatingBarIndicator(
        rating: movie.voteAverage! / 2,
        itemSize: 15,
        itemCount: 5,
        itemBuilder: (context, index) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
      ),
    );
  }
}
