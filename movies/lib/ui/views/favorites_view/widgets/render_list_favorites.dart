import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/ui/widgets/card_movie.dart';

class RenderListFavorites extends StatelessWidget {
  const RenderListFavorites({super.key, required this.movies});

  final List<QueryDocumentSnapshot?> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final json = movies[index]?.data()! as Map;

        final MovieModel movie = MovieModel.fromJson(
          json['movie'] as Map<String, dynamic>,
        ).copyWith(reference: movies[index]!.reference);
        return CardMovie(
          movie: movie,
          isFavorite: true,
        );
      },
    );
  }
}
