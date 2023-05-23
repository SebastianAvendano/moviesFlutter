import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/data/models/user/user_model.dart';
import 'package:movies/domain/blocs/profile/profile_bloc.dart';
import 'package:movies/ui/views/favorites_view/favorite_controller.dart';
import 'package:movies/ui/views/favorites_view/widgets/render_list_favorites.dart';
import 'package:movies/ui/widgets/activity_indicator.dart';
import 'package:movies/ui/widgets/app_bar.dart';

final injector = GetIt.instance;
final controller = injector.get<FavoriteController>();

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text('Lista de favoritos')),
      body: BlocSelector<ProfileBloc, ProfileState, UserModel>(
        selector: (state) => state.user,
        builder: (context, user) {
          if (user.reference != null) {
            return StreamBuilder<QuerySnapshot>(
              stream: controller.getMovies(user.reference!),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const SizedBox();
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ActivityIndicator();
                }

                final List<QueryDocumentSnapshot?> listMovies =
                    snapshot.data?.docs ?? [];

                return RenderListFavorites(movies: listMovies);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
