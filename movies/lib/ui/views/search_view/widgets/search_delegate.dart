import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/ui/blocs/search/search_bloc.dart';
import 'package:movies/ui/widgets/activity_indicator.dart';
import 'package:movies/ui/widgets/grid_list_movies.dart';

final injector = GetIt.instance;
final controller = injector.get<SearchBloc>();

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
    // TODO: implement buildResults
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(
          create: (_) => controller..add(SearchEventStarted(query)),
        ),
      ],
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const Center(
              child: ActivityIndicator(),
            );
          } else if (state is SearchLoaded) {
            return GridListMovies(movies: state.movieList, size: double.infinity,);
          }
          return Container();
        },
      ),
    );
  }
}
