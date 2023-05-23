import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/data/models/genre_response/genre_response.dart';
import 'package:movies/domain/blocs/genre/genre_bloc.dart';
import 'package:movies/ui/views/home_view/home_controller.dart';
import 'package:movies/ui/views/home_view/widgets/genre_option.dart';
import 'package:movies/ui/views/home_view/widgets/list_movies.dart';
import 'package:movies/ui/widgets/activity_indicator.dart';

final injector = GetIt.instance;
final controller = injector.get<HomeController>();

class ListGenres extends StatefulWidget {
  final int selectedGenre;

  const ListGenres({super.key, this.selectedGenre = 28});

  @override
  State<ListGenres> createState() => _ListGenresState();
}

class _ListGenresState extends State<ListGenres> {
  late int selectedGenre;

  @override
  void initState() {
    selectedGenre = widget.selectedGenre;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOptions(),
          const SizedBox(height: 10),
          const ListMovies()
        ],
      ),
    );
  }

  BlocBuilder<GenreBloc, GenreState> _buildOptions() {
    return BlocBuilder<GenreBloc, GenreState>(
      builder: (context, state) {
        if (state.isLoading) {
          const ActivityIndicator();
        } else if (state.genres.isNotEmpty) {
          List<Genre> genres = state.genres;
          return SizedBox(
            height: 45,
            child: ListView.separated(
                itemCount: genres.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    const VerticalDivider(
                      color: Colors.transparent,
                      width: 1,
                    ),
                itemBuilder: (context, index) {
                  Genre genre = genres[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Genre genre = genres[index];
                        selectedGenre = genre.id!;
                        controller.onChangeGenre(
                          context: context,
                          idGenre: genre.id!,
                        );
                      });
                    },
                    child: GenreOption(
                      genre: genre,
                      selectedGenre: selectedGenre,
                    ),
                  );
                }),
          );
        }
        return Container();
      },
    );
  }
}
