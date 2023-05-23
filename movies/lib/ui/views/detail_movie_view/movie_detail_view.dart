import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/models/movie/movie_model.dart';
import 'package:movies/domain/blocs/movie/movie_bloc.dart';

import 'widgets/render_body.dart';
import 'widgets/sliver_appbar.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MovieBloc, MovieState, MovieModel>(
      selector: (state) => state.selectedMovie!,
      builder: (context, movie) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              CustomSliverAppBar(movie),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    RenderBody(movie),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
