import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/domain/blocs/movie/movie_bloc.dart';
import 'package:movies/ui/views/search_view/search_controller.dart';
import 'package:movies/ui/widgets/activity_indicator.dart';
import 'package:movies/ui/widgets/grid_list_movies.dart';

final injector = GetIt.instance;
final controller = injector.get<SearchController>();

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('data');
  }

  Widget _empyContainer() {
    return const Center(
      child: Icon(
        Icons.movie_creation_outlined,
        color: Colors.black38,
        size: 100,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _empyContainer();
    }
    controller.searchMovies(context: context, query: query);
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: ActivityIndicator(),
          );
        }
        return GridListMovies(movies: state.movies);
      },
    );
  }
}
