import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/ui/theme/colors_theme.dart';
import 'package:movies/ui/widgets/activity_indicator.dart';

class CustomSliverAppBar extends StatelessWidget {
  final MovieModel movie;
  const CustomSliverAppBar(this.movie, {super.key});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorsAppTheme.blueColor,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          imageUrl: "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageBuilder: (context, imageProvider) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
          placeholder: (context, url) => const ActivityIndicator(),
        ),
      ),
    );
  }
}
