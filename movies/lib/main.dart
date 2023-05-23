import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:movies/domain/blocs/genre/genre_bloc.dart';
import 'package:movies/domain/blocs/movie/movie_bloc.dart';
import 'package:movies/domain/blocs/profile/profile_bloc.dart';
import 'package:movies/ui/views/main_view/main_view.dart';

// Theme project
import 'ui/theme/app_theme.dart';

//Config project
import 'package:movies/di/initial_config.dart';

// Routes
import 'package:movies/ui/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavigationBloc(),
        ),
        BlocProvider<MovieBloc>(
          create: (context) => MovieBloc(),
        ),
        BlocProvider<GenreBloc>(
          create: (context) => GenreBloc(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies app',
        theme: AppTheme.darkTheme,
        onGenerateRoute: RouterGenerator.generateRoute,
        home: const MainView(),
      ),
    );
  }
}
