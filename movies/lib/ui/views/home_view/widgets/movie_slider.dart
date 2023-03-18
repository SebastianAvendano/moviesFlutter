import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/ui/views/home_view/widgets/movie_poster.dart';

class MovieSlider extends StatelessWidget {
  final List<MovieModel> movies;
  const MovieSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: movies.length,
      itemBuilder: (context, index, _) {
        MovieModel movie = movies[index];
        return MoviePoster(movie);
      },
      options: CarouselOptions(
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        pauseAutoPlayOnTouch: true,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
      ),
    );
  }
}
