import 'package:flutter/material.dart';
import 'package:movies/data/models/genre_response/genre_response.dart';
import 'package:movies/ui/theme/colors_theme.dart';

class GenreOption extends StatelessWidget {
  const GenreOption({super.key, required this.genre, required this.selectedGenre});
  final Genre genre;
  final int selectedGenre;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: (genre.id == selectedGenre)
                ? ColorsAppTheme.blueColor
                : ColorsAppTheme.balck_3,
          ),
          child: Text(
            textAlign: TextAlign.center,
            genre.name.toString().toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
