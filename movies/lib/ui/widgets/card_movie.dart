import 'package:cached_network_image/cached_network_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/ui/blocs/favorites/favorites_bloc.dart';
import 'package:movies/ui/blocs/movie_detail/detail_bloc.dart';
import 'package:movies/ui/widgets/activity_indicator.dart';

final injector = GetIt.instance;
final controller = injector.get<FavoritesBloc>();

class CardMovie extends StatelessWidget {
  final MovieModel movie;
  const CardMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: _renderCard(context),
    );
  }

  Column _renderCard(BuildContext context) {
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
                      context.read<DetailBloc>().add(DetailEventStarted(movie));
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
              valueChanged: (_isFavorite) {
                _isFavorite
                    ? controller.add(SetMovie(movie))
                    : print(_isFavorite);
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

  Row _renderStars() {
    return Row(
      children: const [
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
      ],
    );
  }
}
