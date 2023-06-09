import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/ui/theme/colors_theme.dart';

class RenderBody extends StatelessWidget {
  final MovieModel movie;
  const RenderBody(this.movie, {super.key});
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _space(),
                Text(
                  movie.title!,
                  style: textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fecha de estreno ${Jiffy.parseFromDateTime(movie.releaseDate!).format(pattern: 'dd/MM/yyyy')}",
                    ),
                    _renderScore(),
                  ],
                ),
                _space(),
                Text(
                  "Sinopsis",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  movie.overview!,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox _space() => const SizedBox(height: 20);

  Row _renderScore() {
    return Row(
      children: [
        Chip(
          backgroundColor: ColorsAppTheme.balck_1,
          label: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(movie.voteAverage.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
